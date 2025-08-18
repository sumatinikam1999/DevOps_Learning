resource "aws_security_group" "sg" {
  name = var.sg_name
  description = "allow ports"

  ingress  {
    description = "allow all inbound ports"
    from_port = 0
    to_port = 0
    protocol = "tcp"
    cidr_blocks = var.sg_cidr
  }

  egress  {
    description = "allow all outbound ports"
    from_port = 0
    to_port = 0
    protocol = "tcp"
    cidr_blocks = var.sg_cidr
  }
}