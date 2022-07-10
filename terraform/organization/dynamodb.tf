module "dynamodb" {
  source = "../modules/dynamo_db"

  providers = {
    aws = aws.aws
  }

  table_name = "Positions"

  read_capacity = 5

  write_capacity = 5

  hash_key = "position_id"

  attribute = {
    name = "position_id"
    type = "S"
  }
}