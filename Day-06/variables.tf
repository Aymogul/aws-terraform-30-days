#variables for the project
variable "environment" {
  description = "The environment for the resources (e.g., dev, staging, prod)"
  type        = string
  default     = "dev"
}   
variable "project_name" {
  description = "The name of the project"
  type        = string
  default     = "my-terraform-project"
}
variable "tags" {
  description = "A map of tags to apply to resources"
  type        = map(string)
  default     = {}
}   

variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"

  validation {
    condition     = can(cidrsubnet(var.vpc_cidr, 8, 0))
    error_message = "The provided VPC CIDR block is not valid."
  }
}

variable "region" {
  description = "The AWS region to deploy resources in"
  type        = string
  default     = "us-east-1"
}