resource "aws_s3_bucket" "demo" {
  bucket = local.s3_bucket_name # Local variable (computed)

  tags = local.common_tags # Local variable (tags)
}
resource "aws_vpc" "this" {
  cidr_block = "10.0.0.0/16"    
  region    = var.aws_region # Variable reference
}