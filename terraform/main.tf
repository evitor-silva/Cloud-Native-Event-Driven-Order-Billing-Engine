

locals {
  # Bloco de conexão SSH reutilizável
  ssh_connection = {
    type        = "ssh"
    user        = var.ssh_user
    host        = var.ssh_host
    private_key = file(var.ssh_private_key_path)
  }
}

resource "null_resource" "deploy_k8s_manifests" {
  depends_on = [null_resource.install_k3s]

  connection {
    type        = local.ssh_connection.type
    user        = local.ssh_connection.user
    host        = local.ssh_connection.host
    private_key = local.ssh_connection.private_key
  }

  provisioner "remote-exec" {
    inline = [
      "mkdir -p /home/${var.ssh_user}/k8s-manifests"
    ]
  }

  provisioner "file" {
    source      = "${path.module}/../kubernetes-manifests/"
    destination = "/home/${var.ssh_user}/k8s-manifests"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo k3s kubectl apply -f /home/${var.ssh_user}/k8s-manifests/",
      "echo 'Pods e services aplicados com sucesso!'"
    ]
  }
}
