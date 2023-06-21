variable "prefix" {
  default = "gitlab-ami"#"<environment_prefix>"
}

variable "region" {
  default = "ap-south-1"#"<aws_region>"
}

variable "ssh_public_key" {
  type    = string
  default = null
}

variable "ssh_public_key_file" {
  default = "../../../keys/gitlab-ami.pub"#"<public_ssh_key_path>"
}
 
 #The below External IP is created using AWS console
variable "external_ip_allocation" {
  default = "eipalloc-07e92e3eb1f298dfc" #"<external_ip_allocation>"
}