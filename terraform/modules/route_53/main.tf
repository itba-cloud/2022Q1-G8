locals {
  description = "Public zone for ${var.domain}"
  managed_by  = "terraform"
}

resource "aws_route53_zone" "this" {
  name              = var.domain
  comment           = local.description
  delegation_set_id = var.delegation_set_id
  force_destroy     = var.force_destroy

  tags = {
    "name"           = var.domain
    "product-domain" = var.product_domain
    "environment"    = var.environment
    "description"    = local.description
    "managed_by"     = local.managed_by
  }
}