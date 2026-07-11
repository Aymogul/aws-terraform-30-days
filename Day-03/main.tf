terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}


# creating an S3 bucket
resource "aws_s3_bucket" "test_bucket" {
  bucket = "aymogul-terraform-test-bucket"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}