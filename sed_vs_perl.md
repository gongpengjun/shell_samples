# perl vs sed

## perl优于sed一例

### 需求: 将双引号内的单词大写

#### 文件test.txt

```
$ cat test.txt
video_3gpp(3gp),
video_3gpp2(3g2),
application_vnd_mseq(mseq),
application_vnd_3m_post_it_notes(pwn),
application_vnd_3gpp_pic_bw_large(plb),
application_vnd_3gpp_pic_bw_small(psb),
application_vnd_3gpp_pic_bw_var(pvb),
application_vnd_3gpp2_tcap(tcap),
application_x_7z_compressed(7z),
```

#### perl实现方法

```
cat test.txt | perl -ne 's/\((.*)\)/("\U$1")/;print;'
```

#### sed实现方法

```
cat test.txt | sed 's/(\([0-9a-zA-Z]*\))/("\1")/' | sed '/\"\([0-9a-zA-Z]*\)\"/{
	h
	s/.*\"\([0-9a-zA-Z]*\)\".*/"\1"/
	y/abcdefghijklmnopqrstuvwxyz/ABCDEFGHIJKLMNOPQRSTUVWXYZ/
	G
	s/\(.*\)\n\(.*\)\"\([0-9a-zA-Z]*\)\"\(.*\)/\2\1\4/
}'
```
