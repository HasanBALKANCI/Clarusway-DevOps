variable "ec2_name" {
  default = "variable-ec2"
}

variable "ec2_type" {
  default = "t2.micro"
}

variable "ec2_ami" {
  default = "ami-0742b4e673072066f"
}
# variable "s3_bucket_name" {
#   default = "hasan-s3-variable"
# }
variable "num_of_buckets" {
  default = 2
}