output "instance_id" {
  value = aws_instance.private_instance.id
}

output "security_group_id" {
  value = aws_security_group.ec2_sg.id
}
