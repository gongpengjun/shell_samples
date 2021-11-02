# Shell MultiPart FormData

[TOC]

### curl命令参数 `curl -F k=v`

```shell
$ curl -s -x 127.0.0.1:8888 'http://127.0.0.1:8080/api/user.detail' \
  -F source=mychat -F query=gongpengjun
```

### Charles抓包

```http
POST /api/user.detail HTTP/1.1
Host: 127.0.0.1:8080
User-Agent: curl/7.64.1
Accept: */*
Content-Length: 252
Content-Type: multipart/form-data; boundary=------------------------e3549b2de596f4f7
Connection: keep-alive

--------------------------e3549b2de596f4f7
Content-Disposition: form-data; name="source"

mychat
--------------------------e3549b2de596f4f7
Content-Disposition: form-data; name="query"

gongpengjun
--------------------------e3549b2de596f4f7--
```

