module "subnet-SA_REWEB_AZ1_SUBNET" {
  source            = "../module/aws-subnets"
  vpc_id            = data.aws_vpc.vpc_id.id
  availability_zone = "ap-southeast-1b"
  subnet_cidr_block = "10.148.70.0/27"
  additional_tags   = {}
}

# web-server-1
module "SA_REWEB_AZ1" {
  source               = "../module/aws-ec2-instance"
  ami                  = "ami-06acd7cbe65da0fde"
  availability_zone    = "ap-southeast-1b"
  instance_type        = "c4.xlarge"
  key_name             = "karthi"
  subnet_id            = module.subnet-SA_REWEB_AZ1_SUBNET.subnet_id
  vpc_id               = data.aws_vpc.vpc_id.id
  security_group_name  = "PMP-SG-Stock-Webserver-az1"

  additional_tags = {
    "Application" = "PMP"
    "Module"      = "REWEB"
    "Name"        = "AW-SE1PWREWEB01"
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

