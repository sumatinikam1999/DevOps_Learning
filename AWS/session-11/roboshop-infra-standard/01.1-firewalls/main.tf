module "mongodb_sg" {
  source = "../../../session-8/terraform-aws-security-group"
  project_name = var.project_name
  sg_name = "mongodb"
  sg_description = "Allowing traffic from Catalogue, User and VPN"
  vpc_id = data.aws_ssm_parameter.vpc_id.value
  common_tags = merge(
    var.common_tags,
    {
        Component = "MongoDB"
        Name = "mongoDB"
    }
  )
}

module "catalogue_sg" {
  source = "../../../session-8/terraform-aws-security-group"
  project_name = var.project_name
  sg_name = "catalogue"
  sg_description = "Allowing traffic from "
  vpc_id = data.aws_ssm_parameter.vpc_id.value
  common_tags = merge(
    var.common_tags,
    {
        Component = "Catalogue"
        Name = "Catalogue"
    }
  )
}

module "vpn_sg" {
  source = "../../../session-8/terraform-aws-security-group"
  project_name = var.project_name
  sg_name = "vpn"
  sg_description = "Allowing traffic from "
  vpc_id = data.aws_ssm_parameter.vpc_id.value
  common_tags = merge(
    var.common_tags,
    {
        Component = "VPN"
        Name = "Roboshop-VPN"
    }
  )
}


resource "aws_security_group_rule" "mongodb_catalogue" {
  type = "ingress"
  description = "Allowing port number 27017 from catalogue"
  from_port = 27017
  to_port = 27017
  protocol = "tcp"
  source_security_group_id = module.catalogue_sg.security_group_id
  security_group_id = module.mongodb_sg.security_group_id
}

resource "aws_security_group_rule" "mongodb_vpn" {
  type = "ingress"
  description = "Allowing port number 27017 from catalogue"
  from_port = 0
  to_port = 65535
  protocol = "tcp"
  source_security_group_id = module.vpn_sg.security_group_id
  security_group_id = module.mongodb_sg.security_group_id
}


resource "aws_security_group_rule" "catalogue_vpn" {
  type = "ingress"
  description = "Allowing port number 27017 from catalogue"
  from_port = 22
  to_port = 22
  protocol = "tcp"
  source_security_group_id = module.vpn_sg.security_group_id
  security_group_id = module.catalogue_sg.security_group_id
}

resource "aws_security_group_rule" "catalogue_app_alb" {
  type = "ingress"
  description = "Allowing port number 27017 from catalogue"
  from_port = 8080
  to_port = 8080
  protocol = "tcp"
  source_security_group_id = module.app_alb_sg.security_group_id
  security_group_id = module.catalogue_sg.security_group_id
}

module "app_alb_sg" {
  source = "../../terraform-aws-securitygroup"
  project_name = var.project_name
  sg_name = "App-ALB"
  sg_description = "Allowing traffic"
  #sg_ingress_rules = var.sg_ingress_rules
  vpc_id = data.aws_ssm_parameter.vpc_id.value
  common_tags = merge(
    var.common_tags,
    {
        Component = "APP",
        Name = "App-ALB"
    }
  )
}

module "web_sg" {
  source = "../../terraform-aws-securitygroup"
  project_name = var.project_name
  sg_name = "web"
  sg_description = "Allowing traffic"
  #sg_ingress_rules = var.sg_ingress_rules
  vpc_id = data.aws_ssm_parameter.vpc_id.value
  common_tags = merge(
    var.common_tags,
    {
        Component = "Web"
    }
  )
}

module "web_alb_sg" {
  source = "../../terraform-aws-securitygroup"
  project_name = var.project_name
  sg_name = "Web-ALB"
  sg_description = "Allowing traffic"
  #sg_ingress_rules = var.sg_ingress_rules
  vpc_id = data.aws_ssm_parameter.vpc_id.value
  common_tags = merge(
    var.common_tags,
    {
        Component = "Web",
        Name = "Web-ALB"
    }
  )
}

resource "aws_security_group_rule" "app_alb_vpn" {
  type = "ingress"
  description = "Allowing from VPN"
  from_port = 80
  to_port = 80
  protocol = "tcp"
  source_security_group_id = module.vpn_sg.security_group_id
  security_group_id = module.app_alb_sg.security_group_id
}

resource "aws_security_group_rule" "app_alb_web" {
  type = "ingress"
  description = "Allowing fron Web"
  from_port = 22
  to_port = 22
  protocol = "tcp"
  source_security_group_id = module.web_alb_sg.security_group_id
  security_group_id = module.app_alb_sg.security_group_id
}

resource "aws_security_group_rule" "web_vpn" {
  type = "ingress"
  description = "Allowing 80 from vpn"
  from_port = 80
  to_port = 80
  protocol = "tcp"
  source_security_group_id = module.vpn_sg.security_group_id
  security_group_id = module.web_sg.security_group_id
}

resource "aws_security_group_rule" "web_alb" {
  type = "ingress"
  description = "Allowing from web "
  from_port = 80
  to_port = 80
  protocol = "tcp"
  source_security_group_id = module.web_alb.security_group_id
  security_group_id = module.web_sg.security_group_id
}

resource "aws_security_group_rule" "web_alb_internet" {
  type = "ingress"
  description = "Allowing 80 from internet"
  from_port = 443
  to_port = 443
  protocol = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  #source_security_group_id = module.web_alb.security_group_id
  security_group_id = module.web_alb_sg.security_group_id
}