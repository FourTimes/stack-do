# downloader-2
module "subnet-downloader-az2" {
  source            = "../module/aws-subnets"
  vpc_id            = data.aws_vpc.vpc_id.id
  availability_zone =  "ap-southeast-1a"
  subnet_cidr_block = "10.148.70.160/27"
  subnet_name       = "PROD-Stock-WCAPP-az2"
  additional_tags   = {}
}

module "downloader-az2" {
  source               = "../module/aws-ec2-instance"
  ami                  = "ami-06acd7cbe65da0fde"
  availability_zone    = "ap-southeast-1a"
  instance_type        = "c4.xlarge"
  key_name             = "sa_app_stack"
  subnet_id            = module.subnet-downloader-az2.subnet_id
  vpc_id               = data.aws_vpc.vpc_id.id
  security_group_name  = "PMP-SG-Stock-WCAPP-az2"
  additional_tags = {
    "Application" = "PMP"
    "Module"      = "REAPP"
    "Name"        = "AW-SE1APP02"
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
