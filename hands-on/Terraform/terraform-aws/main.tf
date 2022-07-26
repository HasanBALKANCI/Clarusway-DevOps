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
resource "aws_instance" "tf-ec2" {
  # ami           = "ami-0ed9277fb7eb570c9"
  ami           = "ami-042e8287309f5df03"
  instance_type = "t2.micro"
  key_name      = "firstkey" # write your pem file without .pem extension>
  tags = {
    # "Name" = "tf-ec2"
    Name = "tf-ec2-ubuntu"
  }
}
resource "aws_s3_bucket" "bucket-tf" {
  bucket = "hasan-1461-tf-new"

  tags = {
    Name = "hasan-1461-tf"
  }
}
output "tf_example_public_ip" {
  value = aws_instance.tf-ec2.public_ip
}
output "tf_example_s3_meta" {
  value = aws_s3_bucket.bucket-tf.region
}
output "tf_example_private_ip" {
  value = aws_instance.tf-ec2.private_ip
}
