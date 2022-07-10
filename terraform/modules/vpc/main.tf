resource "aws_vpc" "this" {
  cidr_block = var.vpc_cidr_block

  tags = {
    Name = var.vpc_name
  }
}

resource "aws_subnet" "private" {
  vpc_id                  = aws_vpc.this.id
  cidr_block              = var.private_subnet_cidr_block
  map_public_ip_on_launch = false

  tags = {
    Name = var.vpc_private_subnet_name
  }
}