# ---------------------------------------------------------------------------
# Amazon S3 resources
# ---------------------------------------------------------------------------

module "logs" {
  source = "../modules/s3_4.0"

  providers = {
    aws = aws.aws
  }

  bucket_name   = local.s3.logs.bucket_name
  bucket_acl    = local.s3.logs.acl
  force_destroy = true
}

module "website" {
  for_each = local.s3.static_website
  source   = "../modules/s3_4.0"

  providers = {
    aws = aws.aws
  }

  bucket_name   = each.value.bucket_name
  force_destroy = true
  website       = try(each.value.website, null)
  logging = {
    target_bucket = module.logs.bucket_id
    target_prefix = "log/"
  }
  objects = try(each.value.objects, {})
}

# 1 - S3 bucket
resource "aws_s3_bucket" "reports_bucket" {
  provider = aws.aws

  bucket              = "reports-grupo8-2022-1c"
  object_lock_enabled = false

  tags = {
    Name = "Reports"
  }
}

resource "aws_s3_bucket_lifecycle_configuration" "reports_bucket_lifecycle" {
  provider = aws.aws

  bucket = aws_s3_bucket.reports_bucket.id

  rule {
    id = "lifecycle-rule-id"
    status = "Enabled"

    transition {
      days          = 30
      storage_class = "STANDARD_IA" # or "ONEZONE_IA"
    }

    transition {
      days          = 60
      storage_class = "GLACIER"
    }

    expiration {
      days = 90
    }
  }
}

resource "aws_s3_bucket_acl" "reports_bucket_acl" {
  provider = aws.aws

  bucket = aws_s3_bucket.reports_bucket.id
  acl    = "private"
}

resource "aws_s3_bucket_public_access_block" "reports_bucket_pab" {
  provider = aws.aws

  bucket = aws_s3_bucket.reports_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  restrict_public_buckets = true
  ignore_public_acls      = true
}
