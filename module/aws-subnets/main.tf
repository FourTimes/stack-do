resource "aws_subnet" "subnet" {
  vpc_id            = var.vpc_id
  availability_zone = var.availability_zone
  cidr_block        = var.subnet_cidr_block
  tags = tomap(var.additional_tags)
}


