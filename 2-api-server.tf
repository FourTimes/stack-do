module "web-api-az1" {
  source               = "./module/aws-ec2-instance"
  ami                  = "ami-06acd7cbe65da0fde"
  availability_zone    = "ap-southeast-1b"
  instance_type        = "c4.xlarge"
  key_name             = "karthi"
  subnet_id            = "subnet-0f3d54135d5dbb45c"
  vpc_id               = "vpc-00aa81e5bd49a0593"
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
    "3389" = ["0.0.0.0/0"]
    "80"   = ["0.0.0.0/0"]
  }
}


module "web-api-az2" {
  source               = "./module/aws-ec2-instance"
  ami                  = "ami-06acd7cbe65da0fde"
  availability_zone    = "ap-southeast-1a"
  instance_type        = "c4.xlarge"
  key_name             = "karthi"
  subnet_id            = "subnet-0cb61bb03561ac2f1"
  vpc_id               = "vpc-00aa81e5bd49a0593"
  security_group_name  = "PMP-SG-Stock-WCFAPI-az2"
  additional_tags = {
    "Application" = "PMP"
    "Module"      = "REAPI"
    "Name"        = "AW-SE1PWREAPI02"
    "Owner"       = "Myo"
    "Stack"       = "Prod"
    "Type"        = "Instance"
  }
  ingress_rule = {
    "3389" = ["0.0.0.0/0"]
    "80"   = ["0.0.0.0/0"]
  }
}