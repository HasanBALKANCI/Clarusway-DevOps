terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~>4.0"
    }
  }
}

provider "aws" {

  # Configuration options
  region = "us-east-1"
}
data "aws_ami" "tf_ami" {
  most_recent      = true
  owners           = ["amazon"]

  filter {
    name = "name"
    values = ["amzn2-ami-kernel-5.10-hvm-2.0.20220606.1-x86_64-gp2"]
  }
}

resource "aws_instance" "instance" {
  ami = data.aws_ami.tf_ami.id
  instance_type = var.ec2_type
  count = 2
  key_name =   "firstkey" 
  security_groups = ["tf-import-sg"]
  tags = {
    Name = element(var.tf-tags, count.index )
  }


  provisioner "local-exec" {
      command = "echo http://${self.public_ip} > public_ip.txt"
  }

  provisioner "local-exec" {
      command = "echo http://${self.private_ip} > private_ip.txt"    
      
  
  }
  connection {
    host = self.public_ip
    type = "ssh"
    user = "ec2-user"
    private_key = file("firstkey.pem")
  }

  provisioner "remote-exec" {
    inline = [
      "sudo yum -y install httpd",
      "sudo systemctl enable httpd",
      "sudo systemctl start httpd",
      "sudo chmod -R 777 /var/www/html",
      "cd /var/www/html",
      "echo ' HELLO MY FRIENDS I LIKE TERRAFORM ' > /var/www/html/index.html",
      "sudo systemctl restart httpd"
    ]
  }
}

resource "aws_security_group" "tf-sg" {
  name = "tf-import-sg"
  description = "terraform import security group"
    tags = {
    Name = "tf-import-sg"
  }

  ingress {
    from_port   = 80
    protocol    = "tcp"
    to_port     = 80
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 22
    protocol    = "tcp"
    to_port     = 22
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    protocol    = -1
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}

