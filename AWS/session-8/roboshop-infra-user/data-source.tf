data "aws_ami" "devops_ami" {
  most_recent      = true
  name_regex       = "al2023-ami-2023.8.20250818.0-kernel-6.1-x86_64"
  owners           = ["137112412989"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023.8.20250818.0-kernel-6.1-x86_64"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}