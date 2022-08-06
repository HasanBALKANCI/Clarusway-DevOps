variable "ec2_type" {
  default = "t2.micro"
}

variable "num_of_buckets" {
  default = 2
}

variable "tf-tags" {
  type = list(string)
  default = ["terraform-instance-first", "terraform-instance-second"]
}