output "vpc_id" {
  value = aws_vpc.main.id
}

output "public_subnet_ids" {
  value = aws_subnet.public[*].id
}

output "private_subnet_ids" {
  value = aws_subnet.private[*].id
}

output "vpc_flow_log_id" {
  value = aws_flow_log.vpc_flow_log.id
}

output "vpc_flow_log_group_arn" {
  value = aws_cloudwatch_log_group.vpc_flow_logs.arn
}