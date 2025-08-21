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

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id
    tags = merge(
    var.common_tags,
    var.public_route_table_tags
  )
}

resource "aws_route" "public" {
  route_table_id = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.ig.id
  depends_on = [ aws_route_table.public ]
}

# public-route-table -> public-1a-subnet
# public-route-table -> public-1b-subnet
resource "aws_route_table_association" "public" {
  count = length(var.public_subnet_cidr_block)
  subnet_id = element(aws_subnet.public_subnet1[*].id, count.index)
  route_table_id = aws_route_table.public.id
}


resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id
    tags = merge(
    var.common_tags,
    var.private_route_table_tags
  )
}

resource "aws_route_table_association" "private" {
  count = length(var.private_subnet_cidr_block)
  subnet_id = element(aws_subnet.private_subnet1[*].id, count.index)
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table" "database" {
  vpc_id = aws_vpc.main.id
    tags = merge(
    var.common_tags,
    var.database_route_table_tags
  )
}

resource "aws_route_table_association" "database" {
  count = length(var.database_subnet_cidr_block)
  subnet_id = element(aws_subnet.private_subnet1[*].id, count.index)
  route_table_id = aws_route_table.database.id
}