module "lambda_vpc" {
  source = "../modules/vpc"

  providers = {
    aws = aws.aws
  }

  vpc_name                  = local.vpc_name
  vpc_cidr_block            = local.vpc_cidr_block
  vpc_private_subnet_name   = local.vpc_private_subnet_name
  private_subnet_cidr_block = local.private_subnet_cidr_block

}

resource "aws_vpc_endpoint" "this" {
  for_each          = local.vpc_endpoint_services
  vpc_id            = module.lambda_vpc.vpc_id
  service_name      = each.value.service
  vpc_endpoint_type = try(each.value.endpoint_type, "Gateway")
}