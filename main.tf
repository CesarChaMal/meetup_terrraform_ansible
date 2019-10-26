//resource "aws_key_pair" "demo_key" {
//  key_name   = "MyKeyPair"
//  public_key = "${file(var.public_key)}"
//}

resource "aws_instance" "jenkins_master" {
  ami = "ami-092546daafcc8bc0d"

  instance_type = "${var.instance_size}"
  key_name      = "${var.aws_key_name}"

  tags {
    Name    = "jenkins-master"
    owner   = "Eduardo Fonseca"
    projeto = "tcc"
  }

  root_block_device {
    volume_type           = "gp2"
    volume_size           = "80"
    delete_on_termination = "true"
  }

//  connection {
//    private_key = "${var.private_key}"
//    user        = "${var.ansible_user}"
//  }

  # We're assuming the subnet and security group have been defined earlier on

  subnet_id                   = "subnet-1435f538"
  security_groups             = ["sg-0d6bf5dd41589ad85"]
  associate_public_ip_address = true

  //provisioner "remote-exec" {
  //  inline = ["sudo apt-get -qq install python -y"]
  //}

  provisioner "local-exec" {
        command = "sleep 120; ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -u ubuntu --private-key ${var.private_key} -i '${aws_instance.jenkins_master.public_ip}' ${var.playbooks_folder}${var.playbook}"
    }
}