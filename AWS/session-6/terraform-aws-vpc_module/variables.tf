variable "cidr_block" {
  default = "10.0.0.0/16"
}

variable "common_tags" {
  default = {
     Project = "roboshop"
     Environment = "DEV"
     terraform = true
  }
}

variable "vpc_tags" {
  default = {
     Name = "roboshop"
  }
}
variable "igw_tags" {
  default = {
    Name = "roboshop"
  }
}

variable "public_subnet_cidr_block" {
  default = [ "10.0.1.0/24","10.0.2.0/24"]
}

variable "availability_zone" {
  default = [ "us-east-1a","us-east-1b"]
}

variable "public_subnet_tags" {
  default = ["roboshop-public-1a","roboshop-public-1b"]
}

variable "private_subnet_cidr_block" {
  default = [ "10.0.11.0/24","10.0.12.0/24"]
}

variable "private_subnet_tags" {
  default = ["roboshop-private-1a","roboshop-private-1b"]
}

variable "database_subnet_cidr_block" {
  default = [ "10.0.21.0/24","10.0.22.0/24"]
}

variable "database_subnet_tags" {
  default = ["roboshop-database-1a","roboshop-database-1b"]
}