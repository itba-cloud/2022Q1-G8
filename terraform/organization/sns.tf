module "sns" {
  for_each = local.sns_topics
  source   = "../modules/sns"

  providers = {
    aws = aws.aws
  }

  name          = each.value.name
  subscriptions = each.value.subscriptions
}