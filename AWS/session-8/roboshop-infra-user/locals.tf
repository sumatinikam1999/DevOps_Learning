locals {
  vpc_id              = aws_vpc.main.id
  public_subnet_ids   = aws_subnet.public[*].id
  private_subnet_ids  = aws_subnet.private[*].id
  database_subnet_ids = aws_subnet.database[*].id
  azs                 = slice(data.aws_availability_zones.available.names, 0, 2)
}
data "aws_availability_zones" "available" {}
