data "aws_ami" "ec2" {
  most_recent = true

  filter {
    name = "name"
    values = [ "amzn2-ami-hvm-*-x86_64-gp2" ]
  }
  filter {
    name = "virtualization-type"
    values = [ "hvm" ]
  }

  owners = [ "amazon" ]
}

resource "aws_instance" "datasource" {
  ami = data.aws_ami.ec2.id
  instance_type = "t2.micro"
  vpc_security_group_ids = [ aws_security_group.sg.id ]

  tags = {
    Name = "aws-security-group"
  }
}
