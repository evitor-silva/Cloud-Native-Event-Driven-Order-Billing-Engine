variable "ssh_user" {
  type        = string
  description = "SSH user for the VPS"
  default     = "ubuntu"
}

variable "ssh_private_key" {
  type      = string
  sensitive = true
}

variable "ssh_host" {
  type      = string
  sensitive = true
}