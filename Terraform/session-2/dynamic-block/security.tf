variable "ports" {
  default = [22, 80, 443]
}

resource "aws_security_group" "sg" {
  name = "allow-ports"
  description = "allow multiple ports"

  dynamic "ingress" {
    for_each = var.ports
    content {
      from_port = ingress.value
      to_port = ingress.value
      protocol = "tcp"
      cidr_blocks = [ "0.0.0.0/0" ]
    }
  }
}