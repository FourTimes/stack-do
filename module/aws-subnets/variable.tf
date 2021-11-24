variable "vpc_id" {}
variable "availability_zone" {}
variable "subnet_cidr_block" {}
variable "additional_tags" { 
    type = map(string) 
    default = {}
}