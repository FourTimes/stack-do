# web-server-1
module "SA_REWEB_AZ1" {
  source               = "./module/aws-ec2-instance"
  ami                  = "ami-06acd7cbe65da0fde"
  availability_zone    = "ap-southeast-1b"
  instance_type        = "c4.xlarge"
  key_name             = "karthi"
  subnet_id            = "subnet-0a9c7daf94cd909d8"
  vpc_id               = "vpc-00aa81e5bd49a0593"
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
    "3389" = ["0.0.0.0/0"]
  }

}

# web-server-2

module "SA_REWEB_AZ2" {
  source               = "./module/aws-ec2-instance"
  ami                  = "ami-06acd7cbe65da0fde"
  availability_zone    = "ap-southeast-1a"
  instance_type        = "c4.xlarge"
  key_name             = "karthi"
  subnet_id            = "subnet-0783a067b00c6cfef"
  vpc_id               = "vpc-00aa81e5bd49a0593"
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
    "3389" = ["0.0.0.0/0"]
  }

}
