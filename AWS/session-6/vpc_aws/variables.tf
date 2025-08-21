variable "cidr_block" {
  #default = "10.0.0.0/16"
}

variable "enable_dns_hostnames" {
  default = true
}

variable "enable_dns_support" {
  default = true
}

variable "tags" {
  type = map
  default = {} #tag is optional
}

variable "common_tags" {
  default = {}
  type = map
}

variable "vpc_tags" {
  default = {}
  type = map
}

variable "igw_tags" {
  default = {}
  type = map
}

variable "public_subnet_cidr_block" {
  type = list(string)
  default = [ "10.0.1.0/24" ]
}

variable "public_subnet_tags" {

}

variable "availability_zone" {

}

variable "private_subnet_cidr_block" {

}

variable "private_subnet_tags" {

}

variable "database_subnet_cidr_block" {

}

variable "database_subnet_tags" {

}

variable "public_route_table_tags" {
  default = {}
}

variable "private_route_table_tags" {

}

variable "database_route_table_tags" {

}