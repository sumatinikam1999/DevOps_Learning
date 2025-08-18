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
    web = "t2.micro"
  }
}