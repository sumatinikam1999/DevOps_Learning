module "allow_all_sg" {
  source = "../terraform-aws-security-group"
  sg_name = "allow-all"
  sg_description = "Allowing all ports from internet"
  sg_ingress_rules = var.sg_ingress_rules
  vpc_id = local.vpc_id
  project_name = var.project_name

  common_tags = var.common_tags

  sg_tags = var.sg_tags

}