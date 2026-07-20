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