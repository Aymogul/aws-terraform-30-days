variable "aws_region" {
  description = "The AWS region to create resources in."
  default     = "us-east-1"
  
}
variable "environment" {
  description = "The environment to create resources in."
  default     = "dev"
}
variable "resource_tags" {
  description = "A map of tags to add to all resources."
  type        = map(string)
  default     = {}      
}