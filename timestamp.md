# 时间戳

[TOC]

参考资料：https://stackoverflow.com/questions/3249827/convert-unix-timestamp-to-a-date-string

### 1. 网页工具

http://tool.chinaz.com/Tools/unixtime.aspx

### 2. Unix 命令行

#### 2.1 解析时间戳 - 缺省格式

```shell
$ date -d @1581304418
2020年 02月 10日 星期一 11:13:38 CST
```

#### 2.2 解析时间戳 - 英文时间格式

```shell
$ date -d @1581304418 +'%Y-%m-%d %H:%M:%S'
2020-02-10 11:13:38
```

#### 2.3 解析时间戳 - 中文时间格式

```shell
$ echo 1581304418 | gawk '{print strftime("%c", $0)}'
2020年02月10日 星期一 11时13分38
```

## 3. Mac命令行

### 3.1解析时间戳 - 缺省格式

```shell
$ date -r 1581304418
2020年 2月10日 星期一 11时13分38秒 CST
```

### 3.2 解析时间戳 - 英文时间格式

```shell
$ date -r 1581304418 +'%Y-%m-%d %H:%M:%S'
2020-02-10 11:13:38
```

