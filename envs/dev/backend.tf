terraform {
  backend "s3" {
    bucket = "demo-tf-temp-tfstate"
    key    = "dev/terraform.tfstate"
    region = "ap-northeast-1"
    # dynamodb_table = "your-lock-table"   # Optional, for state locking
    encrypt        = true
  }
}
