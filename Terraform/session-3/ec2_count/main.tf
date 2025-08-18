resource "aws_instance" "ec2" {
  for_each = var.instances
  ami           = var.ami
  instance_type = each.value
  tags = {
    Name = each.key
  }
}

resource "aws_route53_record" "route53" {
  for_each = aws_instance.ec2
  zone_id = var.zone_id
  name    = "${each.key}.${var.domain}"
  type    = "A"
  ttl     = 1
  records = [ each.key == "Web" ? each.value.public_ip : each.value.private_ip]
}
