Latency
Traffic
Errors
Saturation
for these we can use ELK

suppose we have two vpcs default and roboshop vpc
we have vpn server on default vpc and we have web,app,db servers in roboshop vpc
so user has to connect to vpc server which is in default vpc and later it can connect to
other server which are in roboshop vpc

they can't directly connect there should be connection between two vpcs
vpc peering

to allow communication between two networks we should to peering
both can't allow traffic from each other
network1 - (peering) - network2

vpc peering
CIDR should not overlap
If CIDR same then peering won't work

create vpc 
vpc-1
10.0.0.0/16
vpc-2
10.1.0.0/16

create subnet - public us east 1a - for vpc-1 - 10.0.1.0/24
create subnet - public us east 1a - for vpc-2 - 10.1.1.0/24

create internet gateway 
vpc-1: attach to vpc-1
vpc-2: attach to vpc-2

create instance - vpc-1 - subnet-vpc-1 - enable public ip - create sg - allow-all-vpc-1 - all tcp -
anywhere - launch instance

for every vpc we have one route table
edit route table for vpc-1 - route to internet - 0.0.0.0/0 - attach igw-vpc-1 - save
edit route table for vpc-2 - route to internet - 0.0.0.0/0 - attach igw-vpc-2 - save

ssh to ec2 in vpc-1

create instance - vpc-1 - subnet-vpc-2 - enable public ip - create sg - allow-all-vpc-2 - all tcp -
anywhere - launch instance

ssh to ec2 in vpc-2

to reach from vpc to subnet we should have route

modem - internet gateway - vpc - route - subnet

try to telnet vpc-2 from vpc-1
telnet ip port(22)
it's connecting because public

try to telnet vpc-2 from vpc-2
telnet ip port(22)
it's connecting because public

try to telnet vpc-2 from vpc-1 from private ip
telnet ip port(22)
it won't connect because private so we need to do peering

go to vpc - peering connections - create peering connection
requesting vpc-1 
acceptor vpc-2
vpc-1 reqesuting
vpc-2 should accept

actions - accept

we should have route also
so in vpc-1 route 
edit route
 add route
add vpc-2 CIDR and peering connection create
vpc-1 should add route to vpc-2 through perring connections


vpc-2 should add the road to the vpc-1 through peering connection

vpc-2 route 
edit
add
vpc-1 CIDR and peering connection


now try to telnet from private








116.89.109.118 20/Sep/2023:02:42:45 +0000 GET /product/ROB-1 HTTP/1.1 404 0.000



%{IP:client} %{HTTPDATE:timestamp} %{WORD:http_method} %{URIPATH:http_path} %{WORD:http}/%{NUMBER:http_version:float} %{NUMBER:http_status:int} %{NUMBER:duration:float}

Elasticsearch
------------------
vim /etc/elasticsearch/elasticsearch.yml

nginx log format
-------------------
$remote_addr $time_local $request $status $request_time

filter {
      grok {
        match => { "%{IP:client} %{HTTPDATE:timestamp} %{WORD:http_method} %{URIPATH:http_path} %{WORD:http}/%{NUMBER:http_version:float} %{NUMBER:http_status:int} %{NUMBER:duration:float}" }
      }
    }

filebeat --> logstash

first stop filebeat
then stop logstash
do the changes in logstash
restart logstash
start filebeat

latency
traffic
errors
saturation --> prometheus


VPC Peering
------------------
vpc-1
vpc-2
public subnet vpc-1
public subnet vpc-2
internet gateways
add the route of internet gateway to the route tables
add the route of vpc peering to the route tables

connecting to instance
--------------------
modem --> AWS data center

VPC should have inernet gateway
subnet
route should be there from internet gateway

vpc-1 is requesting
vpc-2 should accept



vpc-1 should add the road to the vpc-2 through peering connection

10.1.0.0/16

vpc-2 should add the road to the vpc-1 through peering connection
10.0.0.0/16

vpc cidr should not overlap

diff vpc in same region
diff vpc in diff regions
diff vpc in diff account and diff region

ctrl + ]
telnet> q


