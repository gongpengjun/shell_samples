# Shell 脚本常见技巧

[TOC]

## 1、shell模板

### 1.1、shell 入口参数

参考：`shell/template.sh`

```shell
#!/bin/bash

script_name=`basename "$0"`
work_dir=`pwd`
#echo "script_name: ${script_name}"
#echo "work_dir: ${work_dir}"
#echo "full path: ${work_dir}/${script_name}"
if [ $# != 1 ] ; then
    echo "USAGE: ./${script_name} {the_token}"
    echo "e.g.: ./${script_name} 'thetoken'"
    exit;
fi
the_token=$1
if [ -z "${the_token}" ]; then
  the_token="thetoken"
fi
cookie=${the_token}
```

### 1.2、shell for循环遍历数组

示例：`for_1.sh` 和 `for_2.sh`

```shell
#!/bin/bash

## declare an array variable
declare -a arr=("element1" "element2" "element3")

## now loop through the above array
for i in "${arr[@]}"
do
   echo "$i"
   # or do whatever with individual element of the array
done

# You can access them using echo "${arr[0]}", "${arr[1]}" also
```

参考：https://stackoverflow.com/a/8880633/328435

## 2、单引号内使用变量

### 2.1、方法一

https://stackoverflow.com/a/13802438/328435

```shell
#!/bin/bash

variable="hello world"
result='before'"$variable"'after'
echo $result
```

### 2.2、方法二

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

## 3、测试环境变量

https://stackoverflow.com/questions/3601515/how-to-check-if-a-variable-is-set-in-bash

### 3.1、测试环境变量是否存在

```shell
if [ -z ${var+x} ]; then echo "var is unset"; else echo "var is set to '$var'"; fi
```

测试

```shell
$ if [ -z ${var+x} ]; then echo "var is unset"; else echo "var is set to '$var'"; fi
var is unset
$ export var=1
$ if [ -z ${var+x} ]; then echo "var is unset"; else echo "var is set to '$var'"; fi
var is set to '1'
$ unset var
$ if [ -z ${var+x} ]; then echo "var is unset"; else echo "var is set to '$var'"; fi
var is unset
```

### 3.2、测试环境变量非空

```shell
if [ -z "$var" ]; then echo "var is blank"; else echo "var is set to '$var'"; fi
```

测试

```shell
$ if [ -z "$var" ]; then echo "var is blank"; else echo "var is set to '$var'"; fi
var is blank
$ export var=1
$ if [ -z "$var" ]; then echo "var is blank"; else echo "var is set to '$var'"; fi
var is set to '1'
$ unset var
$ if [ -z "$var" ]; then echo "var is blank"; else echo "var is set to '$var'"; fi
var is blank
```

