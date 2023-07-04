#!/bin/bash

filename='os.txt'
n=1
while read line;
do
  echo "line $n : ${line}"
  n=$((n+1))
done < ${filename}
