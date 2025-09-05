module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  name = "workstation"

  instance_type = "t2.micro"
  ami = "ami-00ca32bbc84273381"
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  subnet_id     = "subnet-0201394cf86be363d"
  user_data = file("docker.sh")

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}


resource "aws_security_group" "allow_tls" {
  name        = "allow_all_minikube"
  description = "Allow all traffic for minikube"
  vpc_id      = "vpc-00260dd1966a61d37"

  ingress {
    description = "All traffic from VPC"
    from_port   = 0
    to_port     = 0
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_all_minikube"
  }
}