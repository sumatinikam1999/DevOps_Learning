# output "vpc_id" {
#   value = module.vpc.vpc_id #module.<name>.<output-variable-name>
#   #module developer is giving output as a user we need to capture output
#   #this is capturing output from module dev
# }

output "azs" {
  value = module.vpc.azs
}

output "public_subnet_ids" {
  value = local.public_subnet_ids
}

output "private_subnet_ids" {
  value = local.private_subnet_ids
}

output "database_subnet_ids" {
  value = local.database_subnet_ids
}