loops
count and count index -> iterate in list

for_each -> map/list

create 10 instances using for_each 
declare 10 default values of instances in variable and iterate it using for each


for_each when you iterate over a map, it will give us one special variable each

each.key = each.value
mongodb = t3.medium

map: {}
list: []

count or for each used to create resource block
if we are getting repetitive configuration for that we can use dynamic block not entire resource to create config inside resource


state and remote state
----------------------
declarative scripting that can create resources based on tf files
declarative = terraform responsibility to create resources whatever you write in tf file
tf files = declaration = ordering terrraform
state = terraform has to know what resources terraform created

terraform.tfstage = terraform will see this file to understand the resource it created already

tf files = terraform.tfstate

now tf files don't have egress but terraform.tfstate have egress
then terraform will delete egress and update tf files

when terraform working on something you are not allowed to open terraform.tfstate it will lock the file(terraform.tfstate.lock.info) and after completing work that lock.info will be removed automcatically

terraform is a declarative scripting, terraform responsibilty is to create resources declared in tf files, terraform will create terraform.tfstate to understand the resources it created all the time terraform tries to match tf files with state file

terraform.tfstate
terraform.tfstate.backup

remote state
------------
we have few serious problems if you keep state file in repo or local

1. either you get duplicate resources
2. you get error resources already exists

s3 bucket, you. keep your state file and lock with dynamo DB
