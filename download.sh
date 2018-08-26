#!/bin/bash

#Creating directory for hands-on session related files
mkdir -p ~/kiasutech/elastic/Downloads
cd ~/kiasutech/elastic/Downloads

#Filebeat Download
#curl -L -O https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-6.4.0-linux-x86_64.tar.gz 
#Logstash Download
#curl -L -O https://artifacts.elastic.co/downloads/logstash/logstash-6.4.0.tar.gz
#Elasticsearch Download
curl -L -O https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-6.4.0.tar.gz
tar -xvzf elasticsearch-6.4.0.tar.gz
#Kibana Download
curl -L -O https://artifacts.elastic.co/downloads/kibana/kibana-6.4.0-linux-x86_64.tar.gz
tar -xvzf kibana-6.4.0-linux-x86_64.tar.gz