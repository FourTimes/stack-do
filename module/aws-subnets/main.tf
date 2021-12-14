resource "aws_subnet" "subnet" {
  vpc_id            = var.vpc_id
  availability_zone = var.availability_zone
  cidr_block        = var.subnet_cidr_block
  tags                      = merge({ Name = var.subnet_name }, tomap(var.additional_tags))
}


variable "subnet_name" {}

