# Shell 脚本常见技巧

[TOC]

## 1、单引号内使用变量

### 1.1、方法一

https://stackoverflow.com/a/13802438/328435

```shell
#!/bin/bash

variable="hello world"
result='before'"$variable"'after'
echo $result
```

### 1.2、方法二

```shell
$ cat expand_var_in_single_quotes.sh
BUCKET_NAME=testbucket
OBJECT_NAME=testworkflow-2.0.1.jar
TARGET_LOCATION=/tmp/testworkflow-2.0.1.jar


JSON_STRING=$(jq -c . <<JSON
{
   "bucketname" : "$BUCKET_NAME",
   "objectname" : "$OBJECT_NAME",
   "targetlocation" : "$TARGET_LOCATION"
}
JSON
)
echo $JSON_STRING
```

执行效果

```shell
$ ./expand_var_in_single_quotes.sh
{"bucketname":"testbucket","objectname":"testworkflow-2.0.1.jar","targetlocation":"/tmp/testworkflow-2.0.1.jar"}
```

