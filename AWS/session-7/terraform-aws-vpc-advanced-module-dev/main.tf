resource "aws_vpc" "main" {
  cidr_block       = var.cidr_block
  enable_dns_hostnames = var.enable_dns_hostnames
  enable_dns_support = var.enable_dns_support

  tags = merge(
    var.common_tags,
    {
        Name = var.project_name
    },
    var.vpc_tags
  )
}


resource "aws_internet_gateway" "ig" {
  vpc_id = aws_vpc.main.id

    tags = merge(
    var.common_tags,
    {
        Name = var.project_name
    },
    var.igw_tags
  )
}

resource "aws_subnet" "public" {
  count = length(var.public_subnet_cidr_block)
  vpc_id = aws_vpc.main.id
  cidr_block = var.public_subnet_cidr_block[count.index]
  availability_zone = local.azs[count.index]
  map_public_ip_on_launch = true
    tags = merge(
    var.common_tags,
    {
      Name = "${var.project_name}-public-${local.azs[count.index]}"
    }
  )
}

resource "aws_subnet" "private" {
  count = length(var.private_subnet_cidr_block)
  vpc_id = aws_vpc.main.id
  cidr_block = var.private_subnet_cidr_block[count.index]
  availability_zone = local.azs[count.index]
  
    tags = merge(
    var.common_tags,
    {
      Name = "${var.project_name}-private-${local.azs[count.index]}"
    }
  )
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.ig.id
  }

    tags = merge(
    var.common_tags,
    {
      Name = "${var.project_name}-public"
    },
    var.public_route_table_tags
  )
}

resource "aws_eip" "eip" {
  domain   = "vpc"
}

resource "aws_nat_gateway" "main" {
  allocation_id = aws_eip.eip.id
  # 0 because we are provisioning in us-east-1
  subnet_id     = aws_subnet.public[0].id

    tags = merge(
    var.common_tags,
    {
      Name = var.project_name
    },
    var.nat_tags
  )

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.ig]
}


resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id  = aws_nat_gateway.main.id
  }

    tags = merge(
    var.common_tags,
    {
      Name = "${var.project_name}-private"
    },
    var.private_route_table_tags
  )
}

resource "aws_route_table" "database" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.main.id
  }

    tags = merge(
    var.common_tags,
    {
      Name = "${var.project_name}-databse"
    },
    var.database_route_table_tags
  )
}


resource "aws_route_table_association" "public" {
  count = length(var.public_subnet_cidr_block)
  subnet_id = element(aws_subnet.ublic_subnet1[*].id, count.index)
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "private" {
  count = length(var.private_subnet_cidr_block)
  subnet_id = element(aws_subnet.private_subnet1[*].id, count.index)
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "database" {
  count = length(var.database_subnet_cidr_block)
  subnet_id = element(aws_subnet.database_subnet1[*].id, count.index)
  route_table_id = aws_route_table.database.id
}

resource "aws_db_subnet_group" "roboshop" {
  name = var.project_name
  subnet_ids = aws_subnet.database[*].id

  tags = merge(
    var.common_tags,
    {
      Name = var.project_name
    },
    var.db_subnet_group
  )
}