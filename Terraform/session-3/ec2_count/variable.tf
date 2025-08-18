variable "ami" {
  type        = string
  description = "we are providing value for ami_id"
  default     = "ami-0de716d6197524dd9"
}

# variable "instance_type" {
#   type        = string
#   description = "we are providing value for instance_type"
# }

variable "instances" {
  type = map(any)
  default = {
    MongoDB   = "t3.medium"
    MySQL     = "t3.medium"
    Catalogue = "t2.micro"
    User      = "t2.micro"
    Redis     = "t2.micro"
    Cart      = "t2.micro"
    RabbitMQ  = "t2.micro"
    Payment   = "t2.micro"
    Web = "t2.micro"
  }
}

variable "zone_id" {
  type = string
  default = "Z00027373O2OKHY987PPU"
}

variable "domain" {
  type = string
  default = "devopslearner.space"
}