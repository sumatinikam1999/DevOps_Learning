additional
-map 
key value pair
tags - simple but powerful
key-value
Name=some-name
Environment=DEV/QA/PROD
Terraform=true
Component=MongoDB
Project=Roboshop

variable "tags" {
    type = map
    default = {
      Name = "MongoDB"
    }
}

variables -> input

outputs
output "output-var-name" {
    value = "value"
}

conditions
if(exp){
    if true these statements will run
}
else{
    if false these statements will run
}

expression ? "this will run if true" : "this will run if false"

terraform conditions

if MongoDB we are creating t3.medium or else t2.micro

loops
1. count and count index

count.tf
resource "aws_instance" "conditions" {
    count = 10
    ami = var.ami_id
    instance_type = "t2.micro"
}

route53
when mixing variable and string then ${} - interpolation

functions
no user-defined functions
terraform console 
max(5, 12, 1)
join(" ",["siva", "kumar"])
lower("SUMATI")

I want to create ec2 instance with key
provide public key to instance
resource "aws_key_pair" "mykey" {
  key_name   = "my-key"
  public_key = file("~/.ssh/id_rsa.pub")
}


locals
Like variables, but used for expressions, calculations, or reuse.

They don’t take input → only for inside Terraform.
instead of modifying at multiple places we can use local and we can modify at only local and use it

👉 Example:

locals {
  env           = "dev"
  instance_type = var.env == "prod" ? "t3.medium" : "t2.micro"
}

Terraform State

terraform.tfstate keeps track of resources created.

If you delete resources in AWS manually → state gets out of sync.

Always use Terraform to manage.

👉 Remote State:

Store state in S3 + DynamoDB → for team collaboration.

terraform {
  backend "s3" {
    bucket         = "my-terraform-state"
    key            = "dev/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-locks"
  }
}

terraform.tfvars

File where you store variable values.

Keeps variables.tf clean

👉 Use outputs when you want to expose values of resources created by the same Terraform project.
👉 Use data sources when you want Terraform to fetch information about existing resources that were not created in this project (maybe created manually or in another Terraform project).

Output = “Tell me about what I built”

Data Source = “Tell me about what already exists”

number of lines of codes can be reducedd using dynamic block



locals
------------
locals is also a type of variables, but it can have expressions and functions


AMI ID are frequently chaning
AMI ID is different for different environment

data sources --> you can query the data dynamically from source i.e AWS

I want to create security group in default VPC,

you have old resources created manullay, now you are using terraform to create resources and you have dependency on old resources, so you use data source to fetch info dynamically



t2.micro --> t3.medium

t2.micro --> m4.xlarge

1. change the existing resource --> update resource
2. terminate the resource --> create new resource [you lose the data]

if web you need to have public ip
otherwise private ip

for loop
dynamic blocks
terraform state and remote state
terraform.tfvars

Dynamic blocks are used when you need to create multiple nested blocks inside a resource dynamically, usually with a loop.
Instead of hardcoding many repeated blocks, you generate them using a for_each inside the dynamic block.

variable "ports" {
  default = [22, 80, 443]
}

resource "aws_security_group" "example" {
  name        = "allow-ports"
  description = "Allow multiple ports"

  dynamic "ingress" {
    for_each = var.ports
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}
