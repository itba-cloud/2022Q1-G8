
module "Cognito" {
  source    = "../modules/cognito"
  pool_name = "cognito_pool"
  providers = {
    aws = aws.aws
  }
}