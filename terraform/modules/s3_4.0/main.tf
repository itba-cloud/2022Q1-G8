# ------------------------------------------------------------------------------
# Amazon S3
# ------------------------------------------------------------------------------

# 1 - S3 bucket
resource "aws_s3_bucket" "this" {
  bucket              = var.bucket_name
  object_lock_enabled = var.object_lock_enabled
  force_destroy       = var.force_destroy
}

# 2 -Bucket policy
resource "aws_s3_bucket_policy" "this" {
  count = var.objects != {} ? 1 : 0

  bucket = aws_s3_bucket.this.id
  policy = data.aws_iam_policy_document.this.json
}

# 4 - Access Control List
resource "aws_s3_bucket_acl" "this" {
  bucket = aws_s3_bucket.this.id
  acl    = var.bucket_acl
}

# 3 -Website configuration
resource "aws_s3_bucket_website_configuration" "this" {
  count = length(keys(var.website)) > 0 ? 1 : 0

  bucket = aws_s3_bucket.this.id

  dynamic "index_document" {
    for_each = try([var.website.index_document], [])

    content {
      suffix = index_document.value
    }
  }

  dynamic "error_document" {
    for_each = try([var.website.error_document], [])

    content {
      key = error_document.value
    }
  }

  dynamic "redirect_all_requests_to" {
    for_each = try([var.website.redirect_all_requests_to], [])

    content {
      protocol  = redirect_all_requests_to.value.protocol
      host_name = redirect_all_requests_to.value.host_name
    }
  }
}

# 6 - Logging
resource "aws_s3_bucket_logging" "this" {
  count  = length(keys(var.logging)) > 0 ? 1 : 0
  bucket = aws_s3_bucket.this.id

  target_bucket = var.logging.target_bucket
  target_prefix = try(var.logging.target_prefix, null)
}

# 5 - Upload objects
resource "aws_s3_object" "this" {
  for_each = try(var.objects, {}) #{ for object, key in var.objects: object => key if try(var.objects, {}) != {} }

  bucket        = aws_s3_bucket.this.id
  key           = try(each.value.rendered, replace(each.value.filename, "html/", ""))      # remote path
  source        = try(each.value.rendered, format("../resources/%s", each.value.filename)) # where is the file located
  content_type  = each.value.content_type
  storage_class = try(each.value.tier, "STANDARD")
}