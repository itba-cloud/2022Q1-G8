resource "aws_dynamodb_table" "this" {
  name           = var.table_name
  read_capacity  = var.read_capacity
  write_capacity = var.write_capacity
  hash_key       = var.hash_key

  tags = {
    Name = var.table_name
  }

  attribute {
    name = var.attribute.name
    type = var.attribute.type
  }
}