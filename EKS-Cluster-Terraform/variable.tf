variable "vpc_cidr" {
  type = string
  default = "10.10.0.0/16"
}

variable "public_subnets" {
  type = list(string)
  default = [ "10.10.1.0/24","10.10.2.0/24" ]
}

variable "private_subnets" {
  type = list(string)
  default = [ "10.10.30.1/24","10.10.40.2/24" ]
}

variable "azs" {
  type = list(string)
  default = [ "us-east-2a","us-east-2b" ]
}