#!/bin/bash

script_name=`basename "$0"`
if [ $# -gt 1 ]; then
    echo "USAGE: ./${script_name} {file_name} OR cat | ./${script_name}"
    echo "e.g.: ./${script_name} sample.txt"
    echo "e.g.: cat sample.txt | ./${script_name}"
    exit;
fi

# 变量替换，如果第一个参数$1存在则取$1，否则取/dev/stdin标准输入
# The substitution ${1:-...} takes $1 if defined. 
# Otherwise, the file name of the standard input
# https://stackoverflow.com/a/7045517/328435
filename="${1:-/dev/stdin}"
n=1
while read line;
do
  echo "line $n : ${line}"
  n=$((n+1))
done < ${filename}


exit 0;

$ ./while_read_line_with_line_from_arg_file.sh os.txt
line 1 : CentOS
line 2 : Ubuntu
line 3 : Debian
