resource "aws_instance" "ec2" {
  for_each = var.instances
  ami           = var.ami
  instance_type = each.vlaue
  tags = {
    Name = each.key
  }
}

resource "aws_route53_record" "route53" {
  for_each = 
  zone_id = var.zone_id
  name    = "${var.instance_names[count.index]}.${var.domain}"
  type    = "A"
  ttl     = 1
  records = [aws_instance.conditions[count.index].public_ip]
}
