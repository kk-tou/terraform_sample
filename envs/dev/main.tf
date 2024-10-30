terraform {
  required_version = ">= 1.0.0"
}

module "network" {
  source              = "../../modules/network/aws"
  vpc_cidr            = var.vpc_cidr
  public_subnet_cidrs = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  availability_zones  = var.availability_zones
  project_name        = var.project_name
}

module "compute" {
  source             = "../../modules/compute/aws"
  vpc_id             = module.network.vpc_id
  private_subnet_ids = module.network.private_subnet_ids
  ami_id             = var.ami_id
  instance_type      = var.instance_type
  project_name       = var.project_name
  ssm_kms_key_arn    = var.ssm_kms_key_arn
}

