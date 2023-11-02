output "public-ip-address" {
  value = aws_instance.ec2.public_ip
}