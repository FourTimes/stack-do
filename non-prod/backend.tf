terraform {
  backend "s3" {
    bucket = "sa-terraform-backend-state-store"
    key    = "non-prod/terraform.tfstate"
    region = "ap-southeast-1"
  }
}
