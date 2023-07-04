#!/bin/bash
filename="${1:-/dev/stdin}"
n=1
while read -r line;
do
  echo "line $n : ${line}"
  n=$((n+1))
done < ${filename}