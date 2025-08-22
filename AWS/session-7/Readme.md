NAT : Network Address Translator(it will give only outgoing internet not incoming)
if instances in private subnet wants to communicate with internet then then we can add
NAT gateway to the private route table so that instances can connect to internet

It should have elastic ip
ISP will give dynamic IP address 
you can always request ISP to provide static IP but they will charge for it

Elastic IP - Allocate
associate with instance

incoming: ingress
outgoing: egress

In maximum cases terraform will understand the dependency bet the services but for few
scenarios we need to explicitly mention

aws will provision NAT gateway in public subnet we can attach private subnet to NAT

becausewe can internet connectivity to instances in private subnets for that we will provision NAT gateway in public subnet who has internet access

in public route table you are connecting to internet through internet gateway
but in private route table you are connecting to internet through nat gateway


Module developer
-----------------
resource creation/definitions are here
variables are must, because diff projects have diff requirements
data, locals, functions
module developer has to give documentation about inputs and outputs


Module user
-----------------
he need to provide variables/inputs according to documentation


vpc module
-----------------
we should only allow user to create resources in 1a and 1b region. he can give any region
we should only accept 2 public/private/database subnets.
let's ask project name from user so that we can give

<project-name>-public-<az>
<project-name>-private-<az>
<project-name>-database-<az>

vpc

any server if it wants to install some packages it needs to connect internet

NAT --> it should elastic IP
ISP will give dynamic IP address
you can request ISP to provide static IP, but they charge like 500-1000 rs


EIP
NAT Gateway
we need to add that as route in private and database route tables


