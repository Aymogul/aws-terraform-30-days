# 1. The Core Bucket
resource "aws_s3_bucket" "my_bucket" {
  bucket        = "${var.project_name}-${var.environment}-bucket"
  force_destroy = false # Prevents accidental deletion of bucket with data inside

  tags = local.common_tags
}

# 2. Block All Public Access (Crucial SRE Security Standard)
resource "aws_s3_bucket_public_access_block" "my_bucket" {
  bucket = aws_s3_bucket.my_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# 3. Ownership Controls (Modern replacement for legacy 'acl = "private"')
resource "aws_s3_bucket_ownership_controls" "my_bucket" {
  bucket = aws_s3_bucket.my_bucket.id

  rule {
    object_ownership = "BucketOwnerEnforced" # Disables ACLs entirely (AWS Best Practice)
  }
}

# 4. Versioning Configuration
resource "aws_s3_bucket_versioning" "my_bucket" {
  bucket = aws_s3_bucket.my_bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}

# 5. Server-Side Encryption (SSE-S3)
resource "aws_s3_bucket_server_side_encryption_configuration" "my_bucket" {
  bucket = aws_s3_bucket.my_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}