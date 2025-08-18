tfvars

Ansible
configuration code is same, but how we can use same code to configure multi env
host and diff variables


Iaac
consistency across multi env, we can use same code but different variables

we need 10 instances in DEV and 10 instances in PROD

route53 records
mongodb-dev, mongodb-prod

used to override default values - tfvars

variables.tf - you can keep default values here, it is not mandatory to keep default values. but you should declare variables

terraform.tfvars - to override default values inside variable, or else no need to keep default values inside variables we can directly provide in tfvars

different variable values 
different state you need to give different location to store prod state

multi-env
main diff repos
roboshop-dev
roboshop-prod


pros: code is completely diff, so that we don't mess with dev and prod
cons: you need to work on multiple repos, code is duplicated in 2 


terraform init -reconfigure --backend-config=PROD/backend.tf
