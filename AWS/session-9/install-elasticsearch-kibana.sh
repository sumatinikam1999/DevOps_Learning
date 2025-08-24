sudo dnf install -y java-17-amazon-corretto

vim /etc/yum.repos.d/elastic.repo
[elastic-8.x]
name=Elastic repository for 8.x packages
baseurl=https://artifacts.elastic.co/packages/8.x/yum
gpgcheck=1
gpgkey=https://artifacts.elastic.co/GPG-KEY-elasticsearch
enabled=1
autorefresh=1
type=rpm-md


yum install elasticsearch -y

vim /etc/elasticsearch/elasticsearch.yml
uncomment
http.port: 9200
network.host: 0.0.0.0
add
discovery.type: single-node
comment
#cluster.initial_master_nodes: ["ip-10-0-1-92.ec2.internal"]
make this as false
xpack.security.enabled: false
xpack.security.transport.ssl.enabled: false

systemctl restart elasticsearch

curl localhost:9200

systemctl enable elasticsearch

#install kibana
yum install kibana -y

#kibana is connecting to elastic search so we need to edit kibana configs so that it can connect to elasticsearch
vim /etc/kibana/kibana.yml
uncomment
server.port: 5601
server.host: "0.0.0.0"
elasticsearch.hosts: ["http://localhost:9200"]

systemctl restart kibana

netstat -lntp

tail -f /var/log/kibana/kibana.log 

http://3.227.8.158:5601/app/home#/
explore my own

web generating log files we can push those files
install filebeat on web server and filebeat access the logs and push to elasticsearch


Now on web server where we want to install filebeat
vim /etc/yum.repos.d/elastic.repo
[elastic-8.x]
name=Elastic repository for 8.x packages
baseurl=https://artifacts.elastic.co/packages/8.x/yum
gpgcheck=1
gpgkey=https://artifacts.elastic.co/GPG-KEY-elasticsearch
enabled=1
autorefresh=1
type=rpm-md

sudo yum clean all
sudo rm -rf /var/cache/yum

yum install filebeat -y
vim /etc/filebeat/filebeat.yml
filebeat.iputs
enable: true
paths:
- /var/log/nginx/access.log
the file want to push

filebeat.outputs
setup.ilm.enabled: false
setup.template.enabled: true
setup.template.name: "filebeat"
setup.template.pattern: "filebeat-*"

output.elasticsearch:
  hosts: ["http://3.227.8.158:9200"]
  index: "filebeat-%{[agent.version]}-%{+yyyy.MM.dd}"

where you want to push



systemctl restart filebeat


sudo yum install rsyslog -y
sudo systemctl enable rsyslog
sudo systemctl start rsyslog

tail -f /var/log/messages

generate some traffic on web server load page

go to kibana dashboard
stack management -> index management

cat /var/log/nginx/access.log | wc -l

stack management - data view - create data view - filebeat* - timestamp

you can go in discover to view logs, some data is there in key value format

we need logstash to filter the data 
183.87.235.210 - - [24/Aug/2025:05:41:41 +0000] "GET / HTTP/1.1" 200 615 "-" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36" 
to see in key value format structured format we can use logstash

input - filter - output

when use hit url how much time taking to load url 
nginx response time


systemctl stop nginx
vim /etc/nginx/nginx.conf
add $request_time
'$remote_addr - $remote_user [$time_local] "$request" '
                      '$status $body_bytes_sent "$http_referer" '
                      '"$http_user_agent" "$http_x_forwarded_for" $request_time';

remove everything just keep
'$remote_addr $time_local "$request" $status $request_time' ;

systemctl start nginx

to make keyvalue format we need logstash
yum install logstash -y #on elk machine

vim /etc/logstash/conf.d/logstash.conf
input {
  beats { 
    ports => 5044 
  }
}

output {
  elasticsearch {
    hosts => ["http://localhost:9200"]
    index => "%{[@metadata][beat]}-%{[@metadata][version]}" 
  }

}

systemctl restart logstash
systemctl enable logstash

go to webserver
vim /etc/filebeat/filebeat.yml
earlier we were sending output to elasticsearch now we have logstash so now comment
#output.elasticsearch:
 # hosts: ["10.0.1.92:9200"]
uncomment
output.logstash:
 hosts: ["10.0.1.92:5044"]

restart filebeat

tail -f /var/log/messages
send some traffix
and view kibana dashboard

logstash filter
vim /etc/logstash/conf.d/logstash.conf
input {
  beats { 
    port => 5044 
  }
}

filter {
  grok {
    match => {
      "message" => "%{IP:client} \[%{HTTPDATE:timestamp}\] \"%{WORD:method} %{URIPATH:request} HTTP/%{NUMBER:http_version}\" %{NUMBER:status} %{NUMBER:request_time}"
    }
  }

output {
  elasticsearch {
    hosts => ["http://localhost:9200"]
    index => "%{[@metadata][beat]}-%{[@metadata][version]}" 
  }

}

/var/log/logstash

https://grokdebugger.com/
https://github.com/cjslack/grok-debugger/blob/master/public/patterns/grok-patterns


# cd /usr/share/elasticsearch
# sudo bin/elasticsearch-create-enrollment-token --scope kibana
# bin/elasticsearch-reset-password --username kibana_system
# bin/kibana-verification-code
# /usr/share/kibana/bin/kibana-verification-code

# cd /usr/share/elasticsearch
# sudo bin/elasticsearch-reset-password -u elastic

