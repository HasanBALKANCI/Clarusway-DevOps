terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.23.0"
    }
  }
}

provider "aws" {
  region  = "us-east-1"
  # access_key = "my-access-key"
  # secret_key = "my-secret-key"
  ## profile = "my-profile"
}

resource "aws_instance" "tf-ec2" {
  ami           = "ami-0c02fb55956c7d316"
  instance_type = "t2.micro"
  tags = {
    "Name" = "created-by-tf"
  }
}
resource "aws_s3_bucket" "bucket-tf" {
  bucket = "hasan-1461-tf"

  tags = {
    Name        = "hasan-1461-tf"
  }
}