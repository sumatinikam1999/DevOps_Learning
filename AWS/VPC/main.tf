resource "aws_vpc" "private_cloud" {
    cidr_block = var.cidr_block
}