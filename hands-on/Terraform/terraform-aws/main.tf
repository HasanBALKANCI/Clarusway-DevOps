terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.23.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
  # access_key = "my-access-key"
  # secret_key = "my-secret-key"
  ## profile = "my-profile"
}

# resource "aws_instance" "tf-ec2" {
#   ami           = "ami-0c02fb55956c7d316"
#   instance_type = "t2.micro"
#   tags = {
#     "Name" = "created-by-tf"
#   }
# } 

# variable "ec2_name" {
#   default = "variable-ec2"
# }

# variable "ec2_type" {
#   default = "t2.micro"
# }

# variable "ec2_ami" {
#   default = "ami-0742b4e673072066f"
# }
locals {
  mytag = "haasan-local-name"
}

resource "aws_instance" "tf-ec2" {
  ami           = var.ec2_ami
  instance_type = var.ec2_type
  key_name      = "firstkey"
  tags = {
    Name = "${local.mytag}-come from locals"
  }
}

resource "aws_s3_bucket" "tf-s3" {
  bucket = var.s3_bucket_name
  tags = {
    Name = "${local.mytag}-come from locals"
  }
}
# resource "aws_instance" "ec2-variable" {
#   ami = var.ec2_ami
#   instance_type = var.ec2_type
#   key_name = "firstkey"
#   tags = {
#     "Name" = "${var.ec2_name}-instance"
#   }
# }
variable "s3_bucket_name" {
  default = "hasan-s3-variable"
}
# resource "aws_s3_bucket" "bucket-tf" {
#   bucket = "${var.s3_bucket_name}-bucket"

#   tags = {
#     Name = "${var.s3_bucket_name}-bucket"
#   }
# }
output "tf_example_public_ip" {
  value = aws_instance.tf-ec2.public_dns
}
output "tf_example_s3_meta" {
  value = aws_s3_bucket.tf-s3.region
}
output "tf_example_private_ip" {
  value = aws_instance.tf-ec2.private_ip
}
output "variable-s3" {
  value = aws_s3_bucket.tf-s3[*]
}

