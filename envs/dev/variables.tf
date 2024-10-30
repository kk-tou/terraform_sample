variable "aws_region" {
  type    = string
  default = "ap-northeast-1"
}

variable "vpc_cidr" {
  type    = string
  default = "10.12.0.0/16"
}

variable "public_subnet_cidrs" {
  type    = list(string)
  default = ["10.12.0.0/24", "10.12.16.0/24", "10.12.32.0/24"]
}

variable "private_subnet_cidrs" {
  type    = list(string)
  default = ["10.12.128.0/24", "10.12.144.0/24", "10.12.160.0/24"]
}

variable "availability_zones" {
  type    = list(string)
  default = ["ap-northeast-1a", "ap-northeast-1c", "ap-northeast-1d"]
}

variable "ami_id" {
  type    = string
  default = "ami-03f584e50b2d32776"
}

variable "instance_type" {
  type    = string
  default = "t3.micro"
}

variable "project_name" {
  type    = string
  default = "dev-prj"
}

variable "flow_log_retention_in_days" {
  type        = number
  default     = 7
  description = "Retention period for VPC Flow Logs in CloudWatch Logs."
}

variable "flow_log_traffic_type" {
  type        = string
  default     = "ALL"  # Options: ALL, ACCEPT, REJECT
  description = "Type of traffic to log in the VPC Flow Logs."
}

variable "ssm_kms_key_arn" {
  type        = string
  description = "The KMS key ARN used for SSM encryption"
}
