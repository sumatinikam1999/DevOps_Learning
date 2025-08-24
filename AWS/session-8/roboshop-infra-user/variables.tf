variable "project_name" {
  type    = string
  default = "roboshop"
}

variable "cidr_block" {
  type    = string
  default = "10.0.0.0/16"
}

variable "common_tags" {
  type = map(string)
  default = {
    Project     = "roboshop"
    Environment = "DEV"
    Terraform   = "true"
  }
}

variable "public_subnet_cidr_block" {
  type    = list(string)
  default = ["10.0.1.0/24","10.0.2.0/24"]
}

variable "private_subnet_cidr_block" {
  type    = list(string)
  default = ["10.0.11.0/24","10.0.12.0/24"]
}

variable "database_subnet_cidr_block" {
  type    = list(string)
  default = ["10.0.21.0/24","10.0.22.0/24"]
}

# Security Group Rules
variable "sg_ingress_rules" {
  type = list
  
  default = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      description = "allowing all traffic from internet"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]
}

variable "sg_description" {
  type    = string
  default = "Allowing traffic"
}

variable "sg_name" {
  type    = string
  default = "allow-all"
}

# Optional tags (to prevent errors in merge())
variable "vpc_tags" {
  type    = map(string)
  default = {}
}

variable "igw_tags" {
  type    = map(string)
  default = {}
}

variable "public_route_table_tags" {
  type    = map(string)
  default = {}
}

variable "private_route_table_tags" {
  type    = map(string)
  default = {}
}

variable "database_route_table_tags" {
  type    = map(string)
  default = {}
}

variable "nat_tags" {
  type    = map(string)
  default = {}
}

variable "db_subnet_group" {
  type    = map(string)
  default = {}
}

variable "sg_tags" {
  type    = map(string)
  default = {}
}

variable "instances" {
  default = {
    Mongodb = "t3.medium"
    #Mysql = "t3.medium"
    #Redis = "t2.micro"
    User = "t2.micro"
    Cart = "t2.micro"
    Catalogue = "t2.micro"
    #Shipping = "t2.micro"
    Web = "t2.micro"
    #Payment = "t2.micro"
    #Rabbitmq = "t2.micro"
  }
}

variable "zone_name" {
  default = "905418155083.realhandsonlabs.net."
}
