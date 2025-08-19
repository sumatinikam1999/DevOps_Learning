module "ec2" {
  source = "../session-4/ec2_module"
  ami_id = "ami-0de716d6197524dd9"
  instance_type = "t2.micro"
}