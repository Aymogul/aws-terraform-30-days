# create the backend for this project
terraform {
  backend "s3" {
    bucket = "ay-terraform-remote-backend-s3"
    key    = "day-08/terraform.tfstate"
    region = "us-east-1"
  }
}
