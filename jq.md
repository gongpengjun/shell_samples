# jq 常见技巧和示例

手册：https://stedolan.github.io/jq/manual/v1.6/

入门：https://stedolan.github.io/jq/tutorial/

[TOC]

## 1. 提取指定字段

### 1.1 单纯提取指定字段

```shell
$ jq '.key1, key2'
```

or

```shell
$ jq '.key1.keya, key2'
```

### 1.2 提取指定字段并输出JSON

> 参考 `man jq` - `Object Construction`

#### 1.2.0 输出选项 `-c `

`--compact-output` / `-c` : Using this option will result in compact output by putting each JSON object on  a  single line. 一行一个JSON对象

#### 1.2.1 提取顶级字段

```shell
$ jq '{ .key1, key2 }'
```

例子：

```shell
$ echo '{"a": 42, "b": 17, "c": 20}' | jq -c '{a, b}'
{"a":42,"b":17}
```

#### 1.2.2 提取嵌套字段

```shell
$ jq '{ keya : .key1.keya, key2 }'
```

例子：

```shell
$ echo '{"fruit":{"name":"apple","color":"green","price":1.20}}' | jq -c '{ name: .fruit.name, color: .fruit.color }'
{"name":"apple","color":"green"}
```

## 2. 剔除字段

### 2.1 剔除指定的字段

#### 2.1.1 删除指定的字段

```shell
jq 'del(.departmentInfo)'
```

示例

```shell
$ echo '{"name":"\u7f57\u68ee\u5854\u5c14","empNum":"D19850","ldap":"tangjunwei","departmentInfo":[{"deptId":"100581","name":"\u5df4\u91cc","id":"100581"},{"deptId":"107783","name":"\u5854\u5170\u6258","id":"107783"},{"deptId":"107786","name":"\u5854\u6069\u8c6a\u68ee","id":"107786"},{"deptId":"107789","name":"\u5854\u8fc8","id":"107789"}],"device_type":"ios"}'|jq -c 'del(.departmentInfo)'
{"name":"罗森塔尔","empNum":"D19850","ldap":"tangjunwei","device_type":"ios"}
```

#### 2.1.2 递归删除指定的字段

递归删除任意级别的`department_info`字段

```shell
jq 'walk(if type == "object" then del(.department_info) else . end)'
```

or

递归删除任意级别的`department_info`字段

```shell
jq 'del(.. | .department_info?)'
```

or

递归删除任意级别的`department_info`、`work_status`字段

```shell
jq 'del(.. | .department_info?,.work_status?)'
```

or

递归删除任意级别的`department_info`、`work_status`字段

```shell
jq 'del(.. | .["department_info", "work_status"]?)'
```

示例

```shell
cat person.json | jq 'walk(if type == "object" then del(.department_info) else . end)'
```

or

```shell
cat person.json | jq 'del(.. | .department_info?,.work_status?)'
```

or

```shell
cat person.json | jq 'walk(if type == "object" then del(.department_info) | del(.work_status) else . end)'
```

or

```shell
cat person.json | jq 'del(.. | .["department_info", "work_status"]?)'
```

### 2.2 剔除不存在的字段

#### 2.2.1 shell pipe

```shell
| jq 'with_entries(select(.value|.!=null))'
```

or

```shell
| jq 'with_entries(select(.value!=null))'
```

例子

```shell
$ echo '{"a":false}' | jq -c '{ a, b }' | jq -c 'with_entries(select(.value|.!=null))'
{"a":false}
$ echo '{"a":false}' | jq -c '{ a, b }' | jq -c 'with_entries(select(.value!=null))'
{"a":false}
```

#### 2.2.2 jq pipe

```shell
'| with_entries(select(.value|.!=null))'
```

or

```shell
'| with_entries(select(.value!=null))'
```

例子

```shell
$ echo '{"a":false}' | jq -c '{ a, b }' | jq -c 'with_entries(select(.value!=null))'
{"a":false}
```

等价于

```shell
$ echo '{"a":false}' | jq -c '{ a, b }' | jq -c 'to_entries' | jq -c 'map(select(.value!=null))' | jq -c 'from_entries'
{"a":false}
```

