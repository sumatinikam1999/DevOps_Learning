Monitoring
----------

google sre books - chapter 6


white box
you have info about your system completely, what it has

black box
you don't have any info about system
accessing url
and we will report to someother teams if url won't work
don't know what's going on in background

dashboard
just to give data
we can't continuously monitor it

alert 
if something goes wrong we should get alerts

elasticsearch  - search mechanism - searching in url - database
distributed = highly available

kibana - ui - view data - connects to db

logstash
filtering the data coming from agents

we can't store data/logs longtime in server

Monitoring
---------------
incident

high alert

incident ticket for tracking,
p1, p2, p3, p4

latency --> time for response, should be always low

traffic --> how many users are accessing our system

Errors --> 500, 503 these are from server side

Saturation --> benchmark, how many users can access with out any errors

elastic search
--------------
distributed database

kibana
-------------
UI that connects to elasticsearch

logstash
-------------
filter the data coming from agents

filebeat or agents
------------------
filebeat can access log files and they can ship to elasticsearch...

116.89.109.118 - - [20/Sep/2023:02:18:26 +0000] "POST /api/payment/pay/anonymous-12 HTTP/1.1" 200 51 "http://44.202.144.120/payment" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36" "-" 0.4


'$remote_addr [$time_local] $request $status $request_time'

filter {
      grok {
        match => { "message" => "%{IP:client} %{HTTPDATE:timestamp} %{NUMBER:http_status:int} %{NUMBER:duration:float}" }
      }
    }
	
55.3.244.1 GET /index.html 15824 0.043

%{IP:client} %{WORD:method} %{URIPATHPARAM:request} %{NUMBER:bytes} %{NUMBER:duration}

client: 55.3.244.1
method: GET
request: /index.html
bytes: 15824
duration: 0.043

116.89.109.118 20/Sep/2023:02:42:45 +0000 GET /product/ROB-1 HTTP/1.1 404 0.000

 %{HTTPVERSION:version} %{NUMBER:http_status} %{NUMBER:duration:float}


116.89.109.118 20/Sep/2023:02:42:45 +0000 404 0.000

install elk
send the logs through filebeat --> elasticsearch
send the logs from filebeat to logstash and then output





