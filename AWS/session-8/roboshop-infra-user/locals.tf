locals {
  vpc_id              = aws_vpc.main.id
  public_subnet_ids   = aws_subnet.public[*].id
  private_subnet_ids  = aws_subnet.private[*].id
  database_subnet_ids = aws_subnet.database[*].id
  azs                 = slice(data.aws_availability_zones.available.names, 0, 2)
  allow_all_security_group_id = module.allow_all_sg.security_group_id
}
data "aws_availability_zones" "available" {}
