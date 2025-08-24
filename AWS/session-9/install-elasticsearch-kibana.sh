root@ip-10-0-1-173 elasticsearch]# history
    1  sudo dnf install -y java-17-amazon-corretto
    2  vim /etc/yum.repos.d/elastic.repo
    3  yum install elastichsearch -y
    4  sudo yum install elasticsearch -y
    5  vim /etc/elasticsearch/elasticsearch.yml
    6  systemctl restart elasticsearch
    7  curl localhost:9200
    8  systemctl enable elasticsearch
    9  \
   10  curl localhost:9200
   11  sudo systemctl enable elasticsearch
   12  sudo systemctl start elasticsearch
   13  sudo systemctl status elasticsearch
   14  sudo chown -R elasticsearch:elasticsearch /var/lib/elasticsearch
   15  sudo chown -R elasticsearch:elasticsearch /var/log/elasticsearch
   16  sudo systemctl daemon-reload
   17  sudo systemctl restart elasticsearch
   18  sudo systemctl status elasticsearch
   19  sudo journalctl -xeu elasticsearch.service
   20  sudo vim /etc/elasticsearch/jvm.options
   21  sudo systemctl daemon-reload
   22  sudo systemctl restart elasticsearch
   23  sudo vim /etc/elasticsearch/jvm.options
   24  sudo systemctl daemon-reload
   25  sudo systemctl restart elasticsearch
   26  sudo tail -n 50 /var/log/elasticsearch/elasticsearch.log
   27  sudo vim /etc/elasticsearch/elasticsearch.yml
   28  sudo systemctl daemon-reload
   29  sudo systemctl restart elasticsearch
   30  sudo systemctl status elasticsearch
   31  yum install kibana -y
   32  vim /etc/kibana/kibana.yml
   33  systemctl restart kibana
   34  netstat -lntp
   35  tail -f /var/log/kibana/kibana.log 
   36  bin/elasticsearch-create-enrollment-token --scope kibana'
   37  bin/elasticsearch-create-enrollment-token --scope kibana
   38  cd /usr/share/elasticsearch
   39  sudo bin/elasticsearch-create-enrollment-token --scope kibana
   40  bin/elasticsearch-reset-password --username kibana_system
   41  bin/kibana-verification-code
   42  /usr/share/kibana/bin/kibana-verification-code
   43  sudo cat /var/log/elasticsearch/elasticsearch.log | grep "generated password"
   44  cd /usr/share/elasticsearch
   45  sudo bin/elasticsearch-reset-password -u elastic
   46  cd /usr/share/elasticsearch
   47  sudo bin/elasticsearch-reset-password -u elastic
   48  history
[root@ip-10-0-1-173 elasticsearch]# Access


