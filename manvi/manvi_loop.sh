#!/usr/bin/env bash

for (( i=1; i<4; i++ ))
do
  run=()
  roll+=($(ls -d ./test_1/*/ | uniq))
done

tLen=${#roll[@]}
echo ${roll[@]}
echo $tLen

#for i in $roll;do
#    echo $i
#done