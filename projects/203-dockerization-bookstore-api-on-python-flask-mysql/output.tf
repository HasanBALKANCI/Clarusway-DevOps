output "tf_ec2-instaces_public_ip" {
  value = aws_instance.instance.*.public_ip
}