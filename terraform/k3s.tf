resource "null_resource" "install_k3s" {
  connection {
    type        = local.ssh_connection.type
    user        = local.ssh_connection.user
    host        = local.ssh_connection.host
    private_key = local.ssh_connection.private_key
  }

  provisioner "remote-exec" {
    inline = [
      "if ! command -v k3s &> /dev/null; then",
      "  echo 'Instalando K3s na VPS...'",
      "  curl -sfL https://get.k3s.io | sh -s - --write-kubeconfig-mode 644",
      "  echo 'K3s instalado com sucesso!'",
      "else",
      "  echo 'K3s já está instalado. Pulando.'",
      "fi"
    ]
  }
}