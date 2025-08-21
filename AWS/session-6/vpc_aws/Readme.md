#### VPC

This module is going to create
* VPC
* Internet gateway
* 2 public subnets
* 2 private subnets
* 2 database subnets

### Inputs
* cidr block(required) - User has to provide cidr_block
* enable_dns_hostnames(optional) - User can provide dns hostnames, default is false
* enable_dns_support(optional) - User can provide dns support, default is true
* common_tags(optional) - User can provide common tags, default is empty
* vpc_tags(optional) - User can provide vpc tags for vpc resources, default is empty
* igw_tags(optional) - User can provide internet gateway tags for internet gateway resources, default is empty
* public_subnet_cidr(required) - User must provide a list of 2 public subnet CIDR.
* public_subnet_names(required) - User must provide a list of 2 public subnet names.
* az(required) - User must provide two az.
* private_subnet_cidr(required) - User must provide a list of 2 private subnet CIDR.
* private_subnet_names(required) - User must provide a list of 2 private subnet names.
* database_subnet_cidr(required) - User must provide a list of 2 database subnet CIDR.
* database_subnet_names(required) - User must provide a list of 2 database subnet names.