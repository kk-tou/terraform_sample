aws_region         = "ap-northeast-1"
vpc_cidr           = "10.12.0.0/16"
public_subnet_cidrs     = ["10.12.16.0/24", "10.12.32.0/24", "10.12.48.0/24"]
private_subnet_cidrs    = ["10.12.128.0/24", "10.12.144.0/24", "10.12.160.0/24"]
availability_zones = ["ap-northeast-1a", "ap-northeast-1c", "ap-northeast-1d"]
ami_id             = "ami-03f584e50b2d32776"
instance_type      = "t2.micro"
project_name       = "demo-tf-temp"
flow_log_retention_in_days  = 7
flow_log_traffic_type       = "ALL"
ssm_kms_key_arn    = ""

