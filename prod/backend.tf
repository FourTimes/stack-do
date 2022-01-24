terraform {
  backend "s3" {
    bucket = "jenkins-aws-24"
    key    = "prod/terraform.tfstate"
    region = "ap-southeast-1"
  }
}

