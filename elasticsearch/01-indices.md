## Create a simple index
```
PUT /sidfanclub?pretty
GET /_cat/indices?v
```

## Index exists
```
HEAD sidfanclub
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
      "_doc" : {
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
              "height_in_cm" : {
                "type" : "integer"
              },
              "comment" : {
                "type" : "text"
              },
              "dob" : {
                "type" : "date",
                "format": "yyyy-MM-dd"
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
      "_doc" : {
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
              "height_in_cm" : {
                "type" : "integer"
              },
              "comment" : {
                "type" : "text"
              },
              "dob" : {
                "type" : "date",
                "format": "yyyy-MM-dd"
              }
          }
      }
  }
}
```

## Template exists
```
HEAD _template/sid_template
```

## Get template
To get a specific template
```
GET /_template/sid_template
```
To get all templates
```
GET /_template
```

## Delete template
```
DELETE /_template/sid_template
```