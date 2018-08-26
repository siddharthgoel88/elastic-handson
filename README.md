# Elastic Hands-on session

## Prerequisite
- Java 8
- Linux machine

## Download and Running 
Run the following script to download and install Elasticsearch and Kibana on your Linux machine.
```
bash ./download.sh
```

### Starting Elasticsearch
Now you have Elasticsearch and Kibana downloaded to your {{~/kiasutech/elastic/Downloads/}}. Let get them running.
```
sudo su
ulimit -n 65536
su <your-username>
cd ~/kiasutech/elastic/Downloads/elasticsearch-*/
vim config/elasticsearch.yml # uncomment network.host property and set it to 0.0.0.0
./bin/elasticsearch &
```
In about 30 seconds your Elasticsearch instance should be up and running.

To check the status of your Elasticsearch node run the following command :
```
curl -XGET localhost:9200
```
It should return you the status like :
```
{
  "name" : "NTDrCCZ",
  "cluster_name" : "elasticsearch",
  "cluster_uuid" : "FXbpdNnHR7eFqALBSsd8SA",
  "version" : {
    "number" : "6.4.0",
    "build_flavor" : "default",
    "build_type" : "tar",
    "build_hash" : "595516e",
    "build_date" : "2018-08-17T23:18:47.308994Z",
    "build_snapshot" : false,
    "lucene_version" : "7.4.0",
    "minimum_wire_compatibility_version" : "5.6.0",
    "minimum_index_compatibility_version" : "5.0.0"
  },
  "tagline" : "You Know, for Search"
}

```

## Elasticsearch

