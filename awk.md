# Unix awk

[TOC]

参考：

https://catonmat.net/awk-one-liners-explained-part-one

https://catonmat.net/awk-one-liners-explained-part-two

https://catonmat.net/awk-one-liners-explained-part-three

https://catonmat.net/update-on-famous-awk-one-liners-explained

https://catonmat.net/ten-awk-tips-tricks-and-pitfalls

## 1. 使用示例

### 1.1 打印指定行区间

#### 1.1.1 打印指定行区间

line range:  `[2,4]` or `2<=NR && NR<=4` or `NR==2,NR==4`

```shell
$ awk '2<=NR && NR<=4' /etc/passwd
$ awk 'NR==2,NR==4' /etc/passwd
# User Database
#
# Note that this file is consulted directly only when the system is running
```

#### 1.1.2 打印文件前6行

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

#### 1.1.3 打印文件108行到结尾

line range: `[108, ]` or `NR >= 108`

```shell
$ awk 'NR >= 108' /etc/passwd
_nearbyd:*:268:268:Proximity and Ranging Daemon:/var/db/nearbyd:/usr/bin/false
_reportmemoryexception:*:269:269:ReportMemoryException:/var/db/reportmemoryexception:/usr/bin/false
_driverkit:*:270:270:DriverKit:/var/empty:/usr/bin/false
```

### 1.2 if/else

```shell
awk '{ if($1~/pattern/) print "match"; else print "unmatch" }'
```

示例

```shell
$ grep INFO focus_sip.log.json | awk '{if($9~/code/) print $4,$5,$6,$8,$9; else print $4,$5,$6,$8}'
action=recv_message uri=Alice tag=Alice req=INVITE
action=send_message uri=Alice tag=Alice rsp=INVITE code=180
action=send_message uri=Alice tag=Alice rsp=INVITE code=200
action=recv_message uri=Alice tag=Alice req=ACK
action=recv_message uri=Alice tag=Alice req=Re-INVITE
action=send_message uri=Alice tag=Alice rsp=Re-INVITE code=200
action=send_message uri=Bob tag=null req=INVITE
action=send_message uri=Michael tag=null req=INVITE
action=recv_message uri=Bob tag=null rsp=INVITE code=100
action=recv_message uri=Michael tag=null rsp=INVITE code=100
action=recv_message uri=Bob tag=Bob rsp=INVITE code=180
action=recv_message uri=Bob tag=Bob rsp=INVITE code=200
action=send_message uri=Bob tag=Bob req=ACK
action=recv_message uri=Michael tag=Michael rsp=INVITE code=180
action=recv_message uri=Michael tag=Michael rsp=INVITE code=200
action=send_message uri=Michael tag=Michael req=ACK
action=recv_message uri=Alice tag=Alice req=BYE
action=send_message uri=Alice tag=Alice rsp=BYE code=200
action=send_message uri=Bob tag=Bob req=BYE
action=send_message uri=Michael tag=Michael req=BYE
action=recv_message uri=Bob tag=Bob rsp=BYE code=200
action=recv_message uri=Michael tag=Michael rsp=BYE code=200
```

