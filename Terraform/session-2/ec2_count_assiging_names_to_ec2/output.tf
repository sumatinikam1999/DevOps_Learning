output "public_ip" {
  value = aws_instance.conditions[*].public_ip
}
