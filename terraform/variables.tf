variable "ssh_private_key" {
  type      = string
  sensitive = true
}

variable "ssh_host" {
  type      = string
  sensitive = true
}

variable "ssh_host" {
  type        = string
  description = "Public IP of the VPS"
  sensitive   = true
}