variable "cidr_block" {
  type = string
  default = "10.0.0.0/16"
}

variable "cidr_block_web_subnet" {
  type = string
  default = "10.0.1.0/24"
}

variable "cidr_block_app_subnet" {
  type = string
  default = "10.0.2.0/24"
}

variable "cidr_block_db_subnet" {
  type = string
  default = "10.0.3.0/24"
}

variable "cidr_block_route_public" {
  type = string
  default = "0.0.0.0/0"
}

variable "cidr_block_route_private" {
  type = string
  default = "10.0.2.0/24"
}

variable "sg_cidr" {
  type = list(string)
  default = [ "0.0.0.0/0" ]
}

