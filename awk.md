# Unix awk

[TOC]

## 使用示例

### 打印指定行区间

#### 打印指定行区间

line range:  `[2,4]` or `2<=NR,NR<=4` or `NR==2,NR==4`

```shell
$ awk 'NR==2,NR==4' /etc/passwd
# User Database
#
# Note that this file is consulted directly only when the system is running
```

#### 打印文件前6行

line range:  `[1,6]` or `NR<=6`

```shell
$ awk 'NR<=6' /etc/passwd
##
# User Database
#
# Note that this file is consulted directly only when the system is running
# in single-user mode.  At other times this information is provided by
# Open Directory.
```

#### 打印文件108行到结尾

line range: `[108, ]` or `NR >= 108`

```shell
$ awk 'NR >= 108' /etc/passwd
_nearbyd:*:268:268:Proximity and Ranging Daemon:/var/db/nearbyd:/usr/bin/false
_reportmemoryexception:*:269:269:ReportMemoryException:/var/db/reportmemoryexception:/usr/bin/false
_driverkit:*:270:270:DriverKit:/var/empty:/usr/bin/false
```

