data "aws_ami" "ec2" {
  most_recent = true

  filter {
  name = "name"
  values = ["amzn2-ami-hvm-*-x86_64-gp2"]
}

 filter {
   name = "virtualization-type"
   values = [ "hvm" ]
 }

 owners = ["amazon"]
}

resource "aws_instance" "linux" {
      for_each = var.instances
      instance_type = each.value
      ami = data.aws_ami.ec2.id

      tags = {
        Name = each.key
      }
}

resource "aws_route53_record" "www" {
  for_each = aws_instance.linux
  zone_id = var.zone_id
  name    = "${each.key}.${var.domain}"
  type    = "A"
  ttl     = 300
  records = [ each.key == "Web" ? each.value.public_ip : each.value.private_ip ]
}