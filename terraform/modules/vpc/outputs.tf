
output "vpc_id" {
  description = "VPC ID"
  value       = aws_vpc.this.id
}

output "vpc_arn" {
  description = "VPC ARN"
  value       = aws_vpc.this.arn
}

output "vpc_cidr_block" {
  description = "VPC CIDR"
  value       = aws_vpc.this.cidr_block
}

output "default_security_group_id" {
  description = "VPC default SG ID"
  value       = aws_vpc.this.default_security_group_id
}

output "private_subnet_id" {
  description = "Private Subnet ID"
  value       = aws_subnet.private.id
}

output "private_subnet_cidr_block" {
  description = "Private Subnet CIDR"
  value       = aws_subnet.private.cidr_block
}