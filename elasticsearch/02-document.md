## Create new document
```
PUT sidfanclub/_doc/1
{
    "firstname" : "John",
    "lastname" : "Doe",
    "height_in_cm" : 165,
    "comment" : "I am really really a big fan of Siddharth",
    "dob" : "1970-07-23"
}

PUT sidfanclub/_doc/2
{
    "firstname" : "John",
    "lastname" : "LittleBitDoe",
    "height_in_cm" : 155,
    "comment" : "I am really really a big fan of Siddharth",
    "dob" : "1970-08-23"
}
```

## Document exists
```
HEAD sidfanclub/_doc/1
```

## Create new document with automatic ID generation
```
POST sidfanclub/_doc/
{
    "firstname" : "John",
    "lastname" : "NotSoDoe",
    "height_in_cm" : 195,
    "comment" : "I am really really a big fan of Siddharth",
    "dob" : "1970-09-23"
}
```

## Get document by ID
```
GET sidfanclub/_doc/1
```

## Delete document by ID
```
DELETE sidfanclub/_doc/1
```

## Delete document(s) by Query
```
POST sidfanclub/_delete_by_query
{
  "query": {
    "range": {
      "height_in_cm": {
        "gte": 170,
        "lte": 200
      }
    }
  }
}
```

## Update document
```
PUT sidfanclub/_doc/2
{
    "firstname" : "John",
    "lastname" : "ReallyLittleBitDoe",
    "height_in_cm" : 155,
    "comment" : "I am really really a big fan of Siddharth",
    "dob" : "1970-08-23"
}
```

## Partial update
```
POST sidfanclub/_doc/2/_update
{
  "doc": {
    "firstname" : "AwesomeJohn"
  }
}
```

## Update by Query
```
POST sidfanclub/_update_by_query
{
  "script": {
    "source": "ctx._source.height_in_cm++",
    "lang": "painless"
  },
  "query": {
    "range": {
      "height_in_cm": {
        "lte": 160
      }
    }
  }
}
```

[Next >>>](03-query-dsl.md)