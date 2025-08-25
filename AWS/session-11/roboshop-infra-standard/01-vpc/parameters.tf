resource "aws_ssm_parameter" "vpc_id" {
  name  = "/${var.project_name}/${var.env}/vpc_id"
  type  = "String"
  value = module.vpc.vpc_id #mdoule should have output declaration
}

resource "aws_ssm_parameter" "public_subnet_ids" {
  name  = "/${var.project_name}/${var.env}/public_subnet_ids"
  type  = "String"
  value = module.vpc.public_subnet_ids #mdoule should have output declaration
}

resource "aws_ssm_parameter" "private_subnet_ids" {
  name  = "/${var.project_name}/${var.env}/private_subnet_ids"
  type  = "String"
  value = module.vpc.private_subnet_ids #mdoule should have output declaration
}

resource "aws_ssm_parameter" "database_subnet_ids" {
  name  = "/${var.project_name}/${var.env}/database_subnet_ids"
  type  = "String"
  value = module.vpc.database_subnet_ids #mdoule should have output declaration
}