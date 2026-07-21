# Backend configuration for Terraform
terraform {
  backend "s3" {
    bucket       = "ay-terraform-remote-backend-s3"
    key          = "dev/terraform.tfstate"
    region       = "us-east-1"
    encrypt      = true
    use_lockfile = true
  }
}