## Create a simple index
```
PUT /sidfanclub?pretty
GET /_cat/indices?v
```

## Delete an index
```
DELETE sidfanclub
GET /_cat/indices?v
```

## Create an index with mapping
```
PUT sidfanclub
{
  "settings": {
    "number_of_shards": 5,
    "number_of_replicas": 1
  }, 
  "mappings" : {
      "mahtype-mahrulz" : {
          "properties" : {
              "firstname" : { 
                "type" : "text",
                "fields" : {
                  "raw" : {
                    "type" : "keyword"
                  }
                }
              },
              "lastname" : { 
                "type" : "text",
                "fields" : {
                  "raw" : {
                    "type" : "keyword"
                  }
                }
              },
              "age" : {
                "type" : "integer"
              },
              "comment" : {
                "type" : "text"
              },
              "dob" : {
                "type" : "date"
              }
          }
      }
  }
}
```

## Get index mapping
```
GET sidfanclub/_mapping
```

## Get index metadata
```
GET sidfanclub
```

## Index templates
```
PUT _template/sid_template
{
  "index_patterns": ["sidfanclub*"],
  "settings": {
    "number_of_shards": 5,
    "number_of_replicas": 1
  },
  "mappings": {
      "mahtype-mahrulz" : {
          "properties" : {
              "firstname" : { 
                "type" : "text",
                "fields" : {
                  "raw" : {
                    "type" : "keyword"
                  }
                }
              },
              "lastname" : { 
                "type" : "text",
                "fields" : {
                  "raw" : {
                    "type" : "keyword"
                  }
                }
              },
              "age" : {
                "type" : "integer"
              },
              "comment" : {
                "type" : "text"
              },
              "dob" : {
                "type" : "date"
              }
          }
      }
  }
}
```