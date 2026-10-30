resource "null_resource" "install_docker" {
  connection {
    type        = local.ssh_connection.type
    user        = local.ssh_connection.user
    host        = local.ssh_connection.host
    private_key = local.ssh_connection.private_key
  }

  provisioner "remote-exec" {
    inline = [
      "if ! command -v docker &> /dev/null; then",
      "  echo 'Instalando Docker na VPS...'",
      "  curl -fsSL https://get.docker.com | sh",
      "  echo 'Docker instalado com sucesso!'",
      "  docker system prune --all --volumes",
      "else",
      "  echo 'Docker já está instalado. Pulando.'",
      "fi"
    ]
  }
}