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
1. main diff repos(while working with large projects)
roboshop-dev
roboshop-prod


pros: code is completely diff, so that we don't mess with dev and prod
cons: you need to work on multiple repos, code is duplicated in 2 

2. same code but different variable and config(while working with small projects)
pros: code us reused
cons: you should be very careful while changing, same code is reflecting to PROD also

3. terraform workspaces 

terraform init -reconfigure -backend-config=DEV/backend.tf

terraform apply -var-file=DEV/dev.tfvars -auto-approve


Modules
you create code reuse it instead of writing same again and again

we will create code - module

whenever you need you can always call modules


keep  code it in one folder and call from another repo