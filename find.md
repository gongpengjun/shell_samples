# Unix命令: find

### 命令格式

```
find pathname -options [-print -exec -ok]
```

-print是缺省选项，-exec是对每个结果文件执行命令，-ok同-exec但执行命令前需要确认

常见的-options有 -name, -size, -mtime, -atime, -ctime等等

## 基础命令

### 文件名匹配: find -name [文件名通配符](https://blog.csdn.net/bluecy/article/details/6545517)

```
$ find . -name "[a-c]*.xml" // 母a到n开头的，并且以.xml结尾的文件
```

```
$ find . -name "A*t.xml" // 查找以A开头且以t.xml结尾的文件
```

```
$ find /usr/bin -name [ck]* // 查找以c或k开头的文件名
```

### 文件大小: find -size +/-xx[cwkMG] 

+表示大于, -表示小于, 后缀表示单位 c:字节，w:双字，k:KB，M:MB，G:GB

```
$ find . +size +100M // 查找大于100MB的文件，用`+100MB`也行
```

```
$ find . -size -100M // 查找小于100MB的文件，用`-100MB`也行
```

## 进阶命令

### 进阶命令: find pathname -options -exec

```
find pathname -options -exec `command` {} \;
```

- {} 代表的是“由find找到的内容”，对于每一个匹配的文件，{}会被替换成相应的文件名
- \; 因为“;”在bash环境下是有特殊意义的，因此利用反斜杠来转义
- `command` 是具体要执行的命令，如 `ls -l` 或 `grep authorities` 等等

示例: 查找文件当中含有SGID或SUID或SBIT的属性的文件，并使用 ls -l 命令显示

```
$ find /usr/bin -perm +7000 -exec ls -l {} \;
```

示例: 查找Android项目中的SDK配置

```
$ find . -name "*.gradle" -type f -exec grep SdkVersion {} \;
```

### 进阶命令: find pathname -options -ok

```
find pathname -options -ok `command` {} \;
```

和-exec一样，但在执行命令前要确认

```
find . -size 0 -ok rm {} \; // 删除大小为0的文件，执行删除前要确认
```

## 参考资料

- [find查找文件](https://www.cnblogs.com/xzxl/p/7555084.html)
- [文件名通配符](https://blog.csdn.net/bluecy/article/details/6545517)
- [find使用示例](https://blog.csdn.net/jaqin/article/details/82928725)