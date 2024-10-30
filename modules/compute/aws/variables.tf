variable "vpc_id" {
  type = string
}

variable "private_subnet_ids" {
  type = list(string)
}

variable "ami_id" {
  type        = string
  description = "AMI ID for the EC2 instance"
}

variable "instance_type" {
  type        = string
  description = "Instance type for the EC2 instance"
}

variable "project_name" {
  type        = string
}

variable "ssm_kms_key_arn" {
  description = "The KMS key ARN used for SSM encryption"
  type        = string
}

