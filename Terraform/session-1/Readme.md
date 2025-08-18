Infrastructure
--------------
Infrastructure as a code --> IaaC/IaC
Terraform --> IaaC very popular

ENV setup

advantages
----------
1. version control
since terraform is a code it should be kept on version control so that we can preserve history and we can revert to previous version if any issues

2. consistent infrastructure
same terraform code you can run against multiple env so all env are same
so we won't face problems like working in dev but not in prod

3. CRUD --> Create Read Update Delete
we can perform CRUD on terraform code

4. Inventory management
It's difficult to check through console
by seeing terraform code you can what are the service and resources you are using a particular project

5. Cost optimization
you can delete resources using one command with terraform but if you do it manually you may forget to delete few resources
when you need create infra, when not required delete infra

6. Dependency management
first create security group and then create ec2 -> manual
ec2, security group -> terraform

7. Modules
reuse the code

DRY -> DOn't repeat your self
Common -> use it whenever required, keep in central location

imperative/declarative

Terraform
Declarative is simple no need to follow sequence mostly everything managed by declarative, we will get it whatever we write when we follow syntax
Terraform is popular declarative scripting for infratsructure management

env var : only for particular user
sys var : set up for all users

vs code -> terraform.exe(authentication aws command line-client) -> aws account-server

vs code
terraform.exe - set path
aws cli
Authentication
create IAM user with admin access
generate access key and secret key
aws configure, give region


Hybride Iaac
- providers
AWS
Google
Azure
Github

our website
develop providers
terraform can create resources for our website

creation of ec2

HCL - hashicorp configuration language

variables
data types
conditions
loops
functions

resource "what-resource" "name-your-resource" {
    arguments/options/parameters
}

what-resource -> you need to get from terraform documentation

os
key
sg
storage

AMI -> mandatory
security group -> optional, if you don't provide security group then default security group will be automatically selected

creation of resource
1. provider -> you need to tell terraform which provider you are using
2. ec2.tf

terraform init -> initialize terraform
terraform plan -> terraform tell us what are resources going to create
terraform plan -> create resources

terraform init
provider will be downloaded inside .terraform folder
we should not push this providers to github
we can mention it in .gitignore

github is only for code not to push big files movies or songs

variables and data types

variable "variable=-name" {

}

string 
number
bool
map
list

delete resources - terraform destroy

1. I will create SG
2. I will attach SG to instance
type.name-of-resource.name

--------------------------------------------------------------------------------------------------------------
