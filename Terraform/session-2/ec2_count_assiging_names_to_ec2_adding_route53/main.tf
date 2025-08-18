/* resource "aws_instance" "ec2" {
  ami           = var.ami
  instance_type = var.instance_type
} */

resource "aws_route53_record" "route53" {
  count   = length(var.instance_names)
  zone_id = var.zone_id
  name    = "${var.instance_names[count.index]}.${var.domain}"
  type    = "A"
  ttl     = 1
  records = [aws_instance.conditions[count.index].public_ip]
}


















