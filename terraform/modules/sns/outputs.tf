output "sns_topic_arn" {
  description = "SNS topic ARN"
  value       = aws_sns_topic.this.arn
}

output "sns_topic_name" {
  description = "SNS topic Name"
  value       = aws_sns_topic.this.name
}

output "sns_topic_id" {
  description = "SNS topic ID"
  value       = aws_sns_topic.this.id
}

output "sns_topic_owner" {
  description = "SNS topic Owner"
  value       = aws_sns_topic.this.owner
}