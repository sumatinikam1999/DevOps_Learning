variable "sg_name" {
  type = string
}

variable "sg_description" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "sg_ingress_rules" {
  type    = list(any)
  default = []
}

variable "common_tags" {
  type    = map(string)
  default = {}
}

variable "sg_tags" {
  type    = map(string)
  default = {}
}

variable "project_name" {
  type = string
}


