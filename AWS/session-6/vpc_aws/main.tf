resource "aws_vpc" "main" {
  cidr_block       = var.cidr_block
  enable_dns_hostnames = var.enable_dns_hostnames
  enable_dns_support = var.enable_dns_support

  tags = merge(
    var.common_tags,
    var.vpc_tags
  )
}

resource "aws_internet_gateway" "ig" {
  vpc_id = aws_vpc.main.id

  tags = merge(
    var.common_tags,
    var.igw_tags
  )
}

resource "aws_subnet" "public_subnet1" {
  count = length(var.public_subnet_cidr_block)
  vpc_id = aws_vpc.main.id
  cidr_block = var.public_subnet_cidr_block[count.index]
  availability_zone = var.availability_zone[count.index]
  
    tags = merge(
    var.common_tags,
    {
      Name = var.public_subnet_tags[count.index]
    }
  )
}

resource "aws_subnet" "private_subnet1" {
  count = length(var.private_subnet_cidr_block)
  vpc_id = aws_vpc.main.id
  cidr_block = var.private_subnet_cidr_block[count.index]
  availability_zone = var.availability_zone[count.index]
  
    tags = merge(
    var.common_tags,
    {
      Name = var.private_subnet_tags[count.index]
    }
  )
}

resource "aws_subnet" "database_subnet1" {
  count = length(var.database_subnet_cidr_block)
  vpc_id = aws_vpc.main.id
  cidr_block = var.database_subnet_cidr_block[count.index]
  availability_zone = var.availability_zone[count.index]
  
    tags = merge(
    var.common_tags,
    {
      Name = var.database_subnet_tags[count.index]
    }
  )
}