# sed 使用示例

[TOC]

参考文档：https://www.cyberciti.biz/faq/how-to-use-sed-to-find-and-replace-text-in-files-in-linux-unix-shell/

 ## 1. 替换指定字符串

### 1.1 示例数据

```shell
$ cat sed/hello.txt
The is a test file created by nixCrft for demo purpose.
foo is good.
Foo is nice.
I love FOO.
```

### 1.2 替换命令

#### 1.2.1 全局替换

```shell
$ sed 's/foo/bar/g' sed/hello.txt
The is a test file created by nixCrft for demo purpose.
bar is good.
Foo is nice.
I love FOO.
```

#### 1.2.2 大小写不敏感替换

安装gnu sed

```shell
$ brew install gnu-sed
```

使用`gsed`执行大小些不敏感替换

```shell
$ gsed 's/foo/bar/gI' sed/hello.txt
The is a test file created by nixCrft for demo purpose.
bar is good.
bar is nice.
I love bar.
```

## 2. 文件内查找直接替换

### 2.1 通过`-i '.bak'`指定备份文件后缀

```shell
$ sed -i '.bak' 's/foo/bar/g' sed/hello.txt
```

### 2.2 通过`-i ''`跳过备份文件

```shell
$ sed -i '' 's/foo/bar/g' sed/hello.txt
```

## 3. 多文件查找替换 - `find -exec sed`

```shell
$ find sed -name *.txt -exec sed -i '' 's/foo/bar/g' {} \;
```

