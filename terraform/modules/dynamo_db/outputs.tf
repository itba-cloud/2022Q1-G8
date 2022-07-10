output "dynamodb_table_id" {
  description = "ID of the DynamoDB table"
  value       = aws_dynamodb_table.this.id
}