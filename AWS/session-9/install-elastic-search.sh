##Install Elastic search
sudo dnf install -y java-17-amazon-corretto

sudo vim /etc/yum.repos.d/elastic.repo
[elasticsearch]
name=Elasticsearch repository for 8.x packages
baseurl=https://artifacts.elastic.co/packages/8.x/yum
gpgcheck=1
gpgkey=https://artifacts.elastic.co/GPG-KEY-elasticsearch
enabled=1
autorefresh=1
type=rpm-md

sudo yum install elasticsearch -y

vim /etc/elasticsearch/elasticsearch.yml
comment
#cluster.initial_master_nodes: ["ip-10-0-1-173.ec2.internal"]
uncomment
network.host: 0.0.0.0
http.port: 9200
discovery.type: single-node

systemctl restart elasticsearch
systemctl enable elasticsearch
curl localhost:9200


#Install Kibana
yum install kibana -y

vim /etc/kibana/kibana.yml
uncomment
server.port: 5601
server.host: "0.0.0.0"
elasticsearch.hosts: ["http://localhost:9200"] #kibana can connect to elastic search on this port
systemctl restart kibana
netstat -lntp

tail -f /var/log/kibana/kibana.log 

http://18.209.31.221:5601/

cd /usr/share/elasticsearch
sudo bin/elasticsearch-create-enrollment-token --scope kibana
bin/elasticsearch-reset-password --username kibana_system
/usr/share/kibana/bin/kibana-verification-code
