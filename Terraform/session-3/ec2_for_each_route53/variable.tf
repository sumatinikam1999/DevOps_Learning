variable "instances" {
  type = map(any)
  default = {
    MONGODB = "t3.medium"
    MySQL = "t3.medium"
    User = "t2.micro"
    Cart = "t2.micro"
    Catalogue = "t2.micro"
    RabbitMQ = "t2.micro"
    Payment = "t2.micro"
    Redis = "t2.micro"
    Payment = "t2.micro"
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