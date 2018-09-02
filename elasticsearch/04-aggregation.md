## Prerequisite
Lets add some sample data to better understand aggregations. Download
accounts.json file and load it to your Elasticsearch instance by running
following command.
```
curl -H 'Content-Type: application/x-ndjson' -XPOST 'localhost:9200/bank/account/_bulk?pretty' --data-binary @accounts.json
```

So this loaded 1000 records in `bank` index with following structure of
data :
```
{
    "account_number": INT,
    "balance": INT,
    "firstname": "String",
    "lastname": "String",
    "age": INT,
    "gender": "M or F",
    "address": "String",
    "employer": "String",
    "email": "String",
    "city": "String",
    "state": "String"
}
```

## Bucket aggregations
Documents belong some some bucket based on the criteria.

### Filter aggregation
```
GET bank/_search
{
  "size": 0,
  "aggs": {
    "_male": {
      "filter": {
        "term": {
          "gender.keyword": "M"
        }
      }
    }
  }
}
```

### Term aggregation
```
GET bank/_search
{
  "size": 0,
  "aggs": {
    "_gender": {
      "terms": {
        "field": "gender.keyword"
      }
    }
  }
}
```

## Metric aggregations
Aggregations that keep track and compute metrics over a set of documents.

### Average aggregation
```
GET bank/_search
{
  "size": 0,
  "aggs": {
    "_gender": {
      "terms": {
        "field": "gender.keyword"
      },
      "aggs": {
        "_avg_balance": {
          "avg": {
            "field": "balance"
          }
        }
      }
    }
  }
}
```

### Max aggregation
```
GET bank/_search
{
  "size": 0,
  "aggs": {
    "_gender": {
      "terms": {
        "field": "gender.keyword"
      },
      "aggs": {
        "_highest_balance": {
          "max": {
            "field": "balance"
          }
        }
      }
    }
  }
}
```

## Pipeline aggregations
Aggregations that aggregate the output of other aggregations and their associated metrics.

### Avg bucket aggregation
```
GET bank/_search
{
  "size": 0,
  "aggs": {
    "_state": {
      "terms": {
        "field": "state.keyword",
        "size": 100
      },
      "aggs": {
        "_avg_balance": {
          "avg": {
            "field": "balance"
          }
        }
      }
    },
    "_highest_balance_across_state" : {
      "max_bucket": {
        "buckets_path": "_state>_avg_balance"
      }
    }
  }
}
```