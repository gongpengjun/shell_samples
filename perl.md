# Perl 使用

[TOC]

## 1. 调用perl

```shell
$ perl -ne
```

`-n` assume `while (<>) { ... }` loop around program

`-e 'command'` one line of program (several `-e`'s allowed, omit programfile)

`-E 'command'` like `-e`, but enables all optional features

示例：

```shell
$ printf 'gate\napple\nwhat\nkite\n' | perl -ne 'print if /at/'
gate
what
```

## 2. 正则表达式

### 2.1 正则定界符

`/regex-pattern/`是`m/regex-pattern/`的简写，使用`m|regex-pattern|`指定使用`|`作为正则定界符

### 2.2 匹配对象

缺省情况下，正则表达式匹配对象是`$_`，即整个输入字符串

```shell
$ echo "GongPengjun" | perl -ne '$string = "GeeksForGeeks"; print $& . "\n" if (/G.*/)'
GongPengjun
```

可以通过`=~`绑定操作符来指定正则表达式的匹配对象

```shell
$ echo "GongPengjun" | perl -ne '$string = "GeeksForGeeks"; print $& . "\n" if ($string =~ /G.*/)'
GeeksForGeeks
```

> 使用`$&`是正则表达式匹配的部分的字符串

### 2.3 非贪婪匹配`?`

缺省是贪婪匹配，增加`?`表示最小长度匹配，即非贪婪匹配

提取html a标签

```shell
$ export html='<ul class="dropdown dd"> <li><a href="support/tutorials-power-tips/" title="Power tips">Power Tips &amp; Tutorials</a></li><li><a href="http://wiki.ultraedit.com/Main_Page" title="UltraEdit text editor wiki">Wiki documentation</a></li><li><a href="http://forums.ultraedit.com/" title="User forums">User forums</a></li><li><a href="support/faq/" title="IDM software FAQ">FAQ</a></li><li><a href="resources.html" title="Resources for IDM software">Resources</a></li><li><a href="support/" title="Technical support">Tech support</a></li> </ul>'

$ echo $html | perl -ne 'print $& . "\n" if m|<a href=.*?</a>|'
<a href="support/tutorials-power-tips/" title="Power tips">Power Tips &amp; Tutorials</a>

$ echo $html | perl -ne 'print $1 . "\n" if m|(<a href=.*?</a>)|'
<a href="support/tutorials-power-tips/" title="Power tips">Power Tips &amp; Tutorials</a>

echo $html | perl -ne 'print $1 . "\n" if m|(<a href=.*</a>)|'
```

>  使用`m`指定使用`|`作为正则表达式的定界符
>
> 使用`()`选择匹配的字符串部分
>
> 使用`$&`是正则表达式匹配的部分的字符串
>
> 使用`?`即`<a href=.*?</a>`表示最短匹配，否则`<a href=.*</a>`将匹配到最后一个`</a>`

```shell
$ echo $html | perl -ne 'print $1 . "\n" if m|(<a href=.*</a>)|'
<a href="support/tutorials-power-tips/" title="Power tips">Power Tips &amp; Tutorials</a></li><li><a href="http://wiki.ultraedit.com/Main_Page" title="UltraEdit text editor wiki">Wiki documentation</a></li><li><a href="http://forums.ultraedit.com/" title="User forums">User forums</a></li><li><a href="support/faq/" title="IDM software FAQ">FAQ</a></li><li><a href="resources.html" title="Resources for IDM software">Resources</a></li><li><a href="support/" title="Technical support">Tech support</a>
```

### 2.4 不捕获`(?:regex-pattern)`

`(regex-pattern)`表示捕获分组，`$1`、`$2` ... 

`(?:regex-pattern)`表示该分组不捕获，`()`仅仅用于regex-pattern优先级

```shell
/\|\|(kvs=)(.*?)(?:\|\||$)/
```

匹配以`||kvs=`开头儿， 以`||`或`$`结尾的最短的字符串，并且 `$1='kvs='`，`$2=匹配的字符串双竖线中间的子字符串去掉'kvs='`

参考：https://www.cnblogs.com/leezhxing/p/4333773.html

## 3. JSON字符串中的单引号

### 3.0 字符串处理示例

```shell
$ cat body.json | jq
{
  "sentence": "let's get to it"
}
$ cat body.json | perl -ne `jq $_`
Missing right curly or square bracket at -e line 1, at end of line
syntax error at -e line 1, at EOF
Execution of -e aborted due to compilation errors.
```

### 3.1 字符串处理示例

```shell
$ cat single_quote.pl
my $string = "How It's Made";
$string =~ s/\'/`/g;
print "$string\n";

$ perl single_quote.pl
How It`s Made
```

### 3.2 JSON处理示例

#### 3.2.1 JSON数据文件

```shell
$ cat data.json
{"sentence":"How It's Made"}
```

#### 3.2.2 Perl脚本代码

```perl6
$ cat single_quote_json.pl
while (<>) {
  chomp;
  my $json_string = $_;
  print "original json string:$json_string\n";
  $json_string =~ s/\'/`/g;
  $pretty_json_string = `jq -n '$json_string'`;
  print "replaced json string:$json_string\n";
  print "pretty   json string:$pretty_json_string\n";
}
```

#### 3.2.3 执行输出结果

```shell
$ cat data.json|perl single_quote_json.pl
original json string:{"sentence":"How It's Made"}
replaced json string:{"sentence":"How It`s Made"}
pretty   json string:{
  "sentence": "How It`s Made"
}
```

