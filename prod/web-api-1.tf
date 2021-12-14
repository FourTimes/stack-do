module "subnet-api-az1" {
  source            = "../module/aws-subnets"
  vpc_id            = data.aws_vpc.vpc_id.id
  availability_zone = "ap-southeast-1b"
  subnet_cidr_block = "10.148.70.64/27"
  additional_tags   = {}
}

module "web-api-az1" {
  source               = "../module/aws-ec2-instance"
  ami                  = "ami-06acd7cbe65da0fde"
  availability_zone    = "ap-southeast-1b"
  instance_type        = "c4.xlarge"
  key_name             = "sa_api_stack"
  subnet_id            = module.subnet-api-az1.subnet_id
  vpc_id               = data.aws_vpc.vpc_id.id
  security_group_name  = "PMP-SG-Stock-WCFAPI-az1"
  additional_tags = {
    "Application" = "PMP"
    "Module"      = "REAPI"
    "Name"        = "AW-SE1PWREAPI01"
    "Owner"       = "Myo"
    "Stack"       = "Prod"
    "Type"        = "Instance"
  }
  ingress_rule = {
    "3389" = ["10.30.205.0/24"]
    "80"   = ["10.30.205.0/24"]
    "443"  = ["10.30.205.0/24"]
  }
}

