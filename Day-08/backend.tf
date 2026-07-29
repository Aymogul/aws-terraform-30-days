# create the backend for this project
terraform {
  backend "s3" {
    bucket = "terraform-30-days"
    key    = "day-08/terraform.tfstate"
    region = "us-east-1"
  }
}   