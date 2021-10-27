# downloader-1
module "downloader-az1" {
  source               = "./module/aws-ec2-instance"
  ami                  = "ami-06acd7cbe65da0fde"
  availability_zone    = "ap-southeast-1b"
  instance_type        = "c4.xlarge"
  key_name             = "karthi"
  subnet_id            = "subnet-0291db32fe74ccd23"
  vpc_id               = "vpc-00aa81e5bd49a0593"
  security_group_name  = "PMP-SG-Stock-WCAPP-az1"

  additional_tags = {
    "Application" = "PMP"
    "Module"      = "REAPP"
    "Name"        = "AW-SE1APP01"
    "Owner"       = "Myo"
    "Stack"       = "Prod"
    "Type"        = "Instance"
  }
  ingress_rule = {
    "3389" = ["0.0.0.0/0"]
  }
}

# downloader-2
module "downloader-az2" {
  source               = "./module/aws-ec2-instance"
  ami                  = "ami-06acd7cbe65da0fde"
  availability_zone    = "ap-southeast-1a"
  instance_type        = "c4.xlarge"
  key_name             = "karthi"
  subnet_id            = "subnet-09874c74ef997e702"
  vpc_id               = "vpc-00aa81e5bd49a0593"
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
    "3389" = ["0.0.0.0/0"]
  }
}
