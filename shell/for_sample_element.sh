#!/bin/bash

## declare an array variable
declare -a arr=("element 1" 
                "element 2" "element 3"
                "element 4")

## now loop through the above array
for element in "${arr[@]}"
do
   echo "${element}"
   # or do whatever with individual element of the array
done

# You can access them using echo "${arr[0]}", "${arr[1]}" also

