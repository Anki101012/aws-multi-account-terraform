resource "aws_s3_bucket" "tf_state_backend" {
  bucket = "helixcloud-tf-state-39xxxxx"

  tags = {
    Name        = "tf_state_backend"
    Environment = "bootstrap_critical"
  }
}

resource "aws_s3_bucket_versioning" "tf_state_version" {
  bucket = aws_s3_bucket.tf_state_backend.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "tf_state_encryption" {
  bucket = aws_s3_bucket.tf_state_backend.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm     = "AES256"
    }
  }
}

resource "aws_s3_bucket_public_access_block" "tf_state_acl" {
  bucket = aws_s3_bucket.tf_state_backend.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_dynamodb_table" "tf_state_locks" {
  name             = "TerraformStateLock"
  hash_key         = "LockID"
  billing_mode     = "PAY_PER_REQUEST"

  attribute {
    name = "LockID"
    type = "S"
  }
}
