resource "aws_s3_bucket" "demo" {
  bucket = local.s3_bucket_name # Local variable (computed)

  tags = local.common_tags # Local variable (tags)
}