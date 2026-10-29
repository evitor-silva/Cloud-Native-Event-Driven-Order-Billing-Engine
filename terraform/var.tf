variable "ssh_user" {
  type        = string
  description = "SSH user for the VPS"
  default     = "ubuntu"
}

variable "ssh_private_key_path" {
  type        = string
  description = "Path to the private SSH key"
  sensitive   = true
}

variable ssh_host {
  type        = string
  description = "Public IP of the VPS"
  sensitive   = true
}