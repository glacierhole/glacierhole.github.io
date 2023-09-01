#!/bin/bash

# 声明关联数组
declare -A count 

# 读取文件逐行
while read line; do

  # 如果不是注释行
  if [[ ! $line == \>* ]]; then

    # 3个字母分段
    segments=$(echo $line | fold -w3)  

    # 统计个数
    for segment in $segments; do
      count[$segment]=$((${count[$segment]} + 1))
      echo $segment 
    done

  fi

done < cds_from_genomic.txt

# 输出统计结果  
for key in "${!count[@]}"; do
  echo "$key: ${count[$key]}" >> sum.txt 
done
