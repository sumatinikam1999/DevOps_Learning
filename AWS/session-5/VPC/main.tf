resource "aws_vpc" "private_cloud" {
    cidr_block = var.cidr_block
}

resource "aws_subnet" "public_subnet_web" {
  vpc_id = aws_vpc.private_cloud.id
  cidr_block = var.cidr_block_web_subnet
  tags = {
    Name = "WEB"
  }
}

resource "aws_subnet" "private_subnet_app" {
  vpc_id = aws_vpc.private_cloud.id
  cidr_block = var.cidr_block_app_subnet
  tags = {
    Name = "APP"
  }
}

resource "aws_subnet" "private_subnet_db" {
  vpc_id = aws_vpc.private_cloud.id
  cidr_block = var.cidr_block_db_subnet
  tags = {
    Name = "DB"
  }
}


resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.private_cloud.id
  tags = {
    Name = "Main"
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.private_cloud.id

  route  {
    cidr_block = var.cidr_block_route_public
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "Main"
  }
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.private_cloud.id

#   route  {
#     cidr_block = var.cidr_block_route_private
#   }

  tags = {
    Name = "Main"
  }
}

resource "aws_route_table_association" "public" {
   subnet_id = aws_subnet.public_subnet_web.id
   route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "private_app" {
  subnet_id = aws_subnet.private_subnet_app.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "private_db" {
  subnet_id = aws_subnet.private_subnet_db.id
  route_table_id = aws_route_table.private.id
}

resource "aws_security_group" "sg" {
  vpc_id = aws_vpc.private_cloud.id
  description = "Allow ports"

  ingress {
    description = "allow"
    from_port = 0
    to_port = 0
    protocol = "tcp"
    cidr_blocks = var.sg_cidr
  }
  egress {
    description = "allow"
    from_port = 0
    to_port = 0
    protocol = "tcp"
    cidr_blocks = var.sg_cidr
  }
}

resource "aws_instance" "server" {
  ami = "ami-00ca32bbc84273381"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.public_subnet_web.id
  vpc_security_group_ids = [ aws_security_group.sg.id ]
  associate_public_ip_address = true
  tags = {
    Name = "PublicServer"
  }
}