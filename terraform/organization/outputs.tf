# output "api_endpoint" {
#   value = aws_api_gateway_stage.this.invoke_url
# }

output "vpc_id" {
  description = "VPC ID"
  value       = module.lambda_vpc.vpc_id
}

output "private_subnet_id" {
  description = "Private Subnet ID"
  value       = module.lambda_vpc.private_subnet_id
}

output "lambda_function_name" {
  description = "The name of the Lambda Function"
  value       = aws_lambda_function.dynamodb_lambda.function_name
}