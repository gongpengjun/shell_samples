# 随机字符串

[TOC]

参考：https://gist.github.com/rkasigi/cf6d5fcc83f821ab2e2bd012c2a0981a



### /dev/urandom

```shell
env LC_CTYPE=C tr -dc "a-zA-Z0-9-_\$\?" < /dev/urandom | head -c 10
```



### ping

```shell
ping -c 1 baidu.com |md5 | head -c8; echo
```

