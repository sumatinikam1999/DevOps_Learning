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

output "aws_instance_info" {
  value = aws_instance.linux
}