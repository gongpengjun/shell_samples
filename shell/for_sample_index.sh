#!/bin/bash

declare -a array=("element 1"
                  "element 2" "element 3"
                  "element 4")

echo "iterate element only in array:"
for element in "${array[@]}"
do
   echo "${element}"
done

echo "iterate element and index in array:"
length=${#array[@]}
for (( i=0; i<${length}; i++ ));
do
  echo "array[$i]: ${array[$i]}"
done

