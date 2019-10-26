variable "ansible_user" {
  description = "description"
  default = "ubuntu"
}

variable "region" {
  description = "description"
  default = "us-east-1"
}

variable "credentials_file" {
  description = "description"
  default = "~/.aws/credentials"
}

variable "profile" {
  description = "description"
  default = "default"
}

variable "private_key" {
  description = "description"
  default = "~/.ssh/meetup.pem"
}


variable "instance_size" {
  description = "description"
  default = "t2.small"
}

variable "aws_key_name" {
  description = "description"
  default = "meetup"
}

variable "playbook" {
  description = "description"
  default = "jenkins.yml"
}

variable "playbooks_folder" {
  description = "description"
  default = "./ansible/"
}

