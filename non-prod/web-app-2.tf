module "subnet-SA_REWEB_AZ2_SUBNET" {
  source                = "../module/aws-subnets"
  vpc_id                = data.aws_vpc.vpc_id.id
  availability_zone     = "ap-southeast-1a"
  subnet_cidr_block     = "10.60.64.32/27"
  additional_tags       = {}
}

module "SA_REWEB_AZ2" {

  source               = "../module/aws-ec2-instance"
  ami                  = "ami-06acd7cbe65da0fde"
  availability_zone    = "ap-southeast-1a"
  instance_type        = "c4.xlarge"
  key_name             = "karthi"
  subnet_id            = module.subnet-SA_REWEB_AZ2_SUBNET.subnet_id
  vpc_id               = data.aws_vpc.vpc_id.id
  security_group_name  = "PMP-SG-Stock-Webserver-az2"

  additional_tags = {
    "Application" = "PMP"
    "Module"      = "REWEB"
    "Name"        = "AW-SE1PWREWEB02"
    "Owner"       = "Myo"
    "Stack"       = "Prod"
    "Type"        = "Instance"
  }

  ingress_rule = {
    "3389" = ["10.30.205.0/24"]
    "80"    = ["10.30.205.0/24"]
    "443" = ["10.30.205.0/24"]
  }

}
