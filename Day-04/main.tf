#configure the AWS provider
terraform {
    backend "s3" {
    bucket = "ay-terraform-remote-backend-s3"
    key    = "dev/terraform.tfstate"
    region = "us-east-1"
    encrypt = true
    lock_table = "ay-terraform-remote-backend-s3-lock"
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}       
