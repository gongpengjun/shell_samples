# xargs

[TOC]

参考：https://www.ruanyifeng.com/blog/2019/08/xargs-tutorial.html

### `xargs`缺省命令`echo`

```shell
$ echo 'one two three' | xargs -t
/bin/echo one two three
one two three
```

### `xargs -t`打印实际执行的命令和参数

```shell
$ echo 'one two three' | xargs -t echo
echo one two three
one two three
```

### `xargs -n`将多少项作为命令参数

```shell
xargs -n 2
```

将每两项做为命令行参数

示例：

```shell
$ echo {0..9} | xargs -n 2 echo
0 1
2 3
4 5
6 7
8 9
```

### `xargs -L`将多少行作为命令参数

```shell
xargs -L 1
```

将每一行做为命令行参数

示例：

```shell
$ echo 'one two three' | xargs -n 1 -t echo
echo one
one
echo two
two
echo three
three
```

### `xargs -I{}` 将参数赋值给多个占位符

```shell
xargs -I{} sh -c 'echo /tmp/test/folder-{}; mkdir -p /tmp/test/folder-{}'
```

示例：

```shell
$ echo {0..9} | xargs -n 1 -I{} sh -c 'echo /tmp/test/folder-{}; mkdir -p /tmp/test/folder-{}'
/tmp/test/folder-0
/tmp/test/folder-1
/tmp/test/folder-2
/tmp/test/folder-3
/tmp/test/folder-4
/tmp/test/folder-5
/tmp/test/folder-6
/tmp/test/folder-7
/tmp/test/folder-8
/tmp/test/folder-9
```

