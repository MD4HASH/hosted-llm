variable "vpc_id" {}
variable "public_subnets" { type = list(string) }
variable "environment" {}
variable "allow_access_from" { type = string }

