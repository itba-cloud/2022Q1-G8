module "sns" {
  for_each = local.sns_topics
  source   = "../modules/sns"

  name          = each.value.name
  subscriptions = each.value.subscriptions
}