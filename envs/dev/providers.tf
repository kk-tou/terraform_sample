terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"  # Allow versions 5.x
    }
  }
}

provider "aws" {
  region = var.aws_region
}
