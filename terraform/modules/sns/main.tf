resource "aws_sns_topic" "this" {
  name = var.name

  tags = {
    Name = var.name
  }

  display_name = try(var.display_name, var.name)
  fifo_topic   = var.fifo_topic
}

resource "aws_sns_topic_subscription" "this" {
  for_each  = { for i, v in var.subscriptions : i => v }
  topic_arn = aws_sns_topic.this.arn
  protocol  = each.value.protocol
  endpoint  = each.value.endpoint
}