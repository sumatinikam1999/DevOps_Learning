data "aws_vpc" "default" {
  default = true
}

data "http" "myip" {
  url = "http://ipv4.icanhazip.com"
}

data "aws_ssm_parameter" "vpc_id" {
  name = "/${var.project_name}/${var.env}/vpc_id"
}


data "aws_ssm_parameter" "vpn_sg_id" {
  name = "/${var.project_name}/${var.env}/vpn_sg_id"
  type = "String"
  value = module.vpn_sg_id.security_group_id
}

data "aws_ssm_parameter" "mongodb_sg_id" {
  name = "/${var.project_name}/${var.env}/mongodb_sg_id"
  type = "String"
  value = module.mongodb_sg_id.security_group_id
}

data "aws_ssm_parameter" "catalogue_sg_id" {
  name = "/${var.project_name}/${var.env}/catalogue_sg_id"
  type = "String"
  value = module.catalogue_sg_id_sg.security_group_id
}

data "aws_ssm_parameter" "web_sg_id" {
  name = "/${var.project_name}/${var.env}/web_sg_id"
  type = "String"
  value = module.web_sg_id_sg.security_group_id
}

data "aws_ssm_parameter" "app_alb_sg" {
  name = "/${var.project_name}/${var.env}/app_alb_sg"
  type = "String"
  value = module.app_alb_sg.security_group_id
}

data "aws_ssm_parameter" "web_alb_sg" {
  name = "/${var.project_name}/${var.env}/web_alb_ag"
  type = "String"
  value = module.web_alb_sg.security_group_id
}