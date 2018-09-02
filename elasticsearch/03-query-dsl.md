## Context
Queries run in one of the following two contexts :
### Query context
- Helps to answer the question “How well does this document match this query clause?"
- Score returned in the result tells how well the document matches.
- To use this context, query clause is passed to `query` parameter.
### Filter context
- Helps to answer the question “Does this document match this query clause?” . So the answer is simple - yes or no.
- To use this context, query clause is passed to `filter` parameter.

## Match All query
```
GET /_search
{
    "query": {
        "match_all": {}
    }
}
```

## Match query
```
GET sidfanclub/_search
{
    "query": {
        "match": {
          "firstname": "John"
        }
    }
}
```

## Term query
```
POST sidfanclub/_search
{
  "query": {
    "term" : { "height_in_cm": 165 }
  }
}
```

Now try one more.

```
POST sidfanclub/_search
{
  "query": {
    "term" : { "firstname": "John" }
  }
}
```
Ques to audience : Why does the query not work?


## Range query
```
POST sidfanclub/_search
{
  "query": {
    "bool": {
      "filter": {
        "range": {
          "height_in_cm": {
            "gte": 160,
            "lte": 170
          }
        }
      }
    }
  }
}
```

## Exists query
```
GET sidfanclub/_search
{
    "query": {
        "exists" : { "field" : "user" }
    }
}
```

## Wildcard query
```
GET sidfanclub/_search
{
    "query": {
        "wildcard": {
          "lastname.raw": {
            "value": "*?Doe"
          }
        }
    }
}
```

## Bool query
### Must clause
```
GET sidfanclub/_search
{
  "query": {
    "bool": {
      "must": [
        {
          "range": {
            "height_in_cm": {
              "gte": 150,
              "lte": 170
            }
          }
        },
        {
          "range": {
            "dob": {
              "lte": "1970-08-01"
            }
          }
        }
      ]
    }
  }
}
```
### Must Not clause
```
GET sidfanclub/_search
{
  "query": {
    "bool": {
      "must": [
        {
          "term": {
            "lastname.raw": {
              "value": "Doe"
            }
          }
        }
      ]
    }
  }
}
```
### Should clause
```
GET sidfanclub/_search
{
  "query": {
    "bool": {
      "should": [
        {
          "range": {
            "height_in_cm": {
              "gte": 150,
              "lte": 170
            }
          }
        },
        {
          "range": {
            "dob": {
              "lte": "1970-08-01"
            }
          }
        }
      ]
    }
  }
}
```