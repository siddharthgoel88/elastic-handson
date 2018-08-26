## Elasticsearch

REST APIs is the interface that we use to talk to our awesome Elaticsearch. We will write all our REST queries in Kibana.

### Cluster health
This gives the health of cluster :
```
GET /_cat/health?v
```
And list of nodes we get like this :
```
GET /_cat/nodes?v
```

### List of indices
```
GET /_cat/indices?v
```