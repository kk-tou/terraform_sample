variable "vpc_cidr" {
  type        = string
  description = "CIDR block for the VPC"
}

variable "public_subnet_cidrs" {
  type        = list(string)
  description = "CIDR blocks for public subnets"
}

variable "private_subnet_cidrs" {
  type        = list(string)
  description = "CIDR blocks for private subnets"
}

variable "availability_zones" {
  type        = list(string)
  description = "List of specific availability zones for subnets"
}

variable "project_name" {
  type        = string
  description = "Prefix for resource naming"
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