terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.23.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
  # Configuration options
}
resource "aws_instance" "tf-ec2" {
  ami           = "ami-0c02fb55956c7d316"
  instance_type = "t2.micro"
} 
  tags = {
    Name = "created_by_tf"
  }