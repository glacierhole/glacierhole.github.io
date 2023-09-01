#!/bin/bash

# 输入文件名
input_file=$1

# 初始化统计变量
range_0_10=0
range_11_20=0
range_21_30=0
range_31_40=0
range_41_50=0
range_51_60=0
range_61_70=0
range_71_80=0
range_81_90=0
range_91_100=0

# 循环遍历输入文件的每一行
while IFS= read -r line; do
  # 提取第三列数据
  third_column=$(echo "$line" | awk '{print $3}')

  # 判断所在区间并累加
  if ((third_column >= 0 && third_column <= 10)); then
    ((range_0_10++))
  elif ((third_column >= 11 && third_column <= 20)); then
    ((range_11_20++))
  elif ((third_column >= 21 && third_column <= 30)); then
    ((range_21_30++))
  elif ((third_column >= 31 && third_column <= 40)); then
    ((range_31_40++))
  elif ((third_column >= 41 && third_column <= 50)); then
    ((range_41_50++))
   elif ((third_column >= 51 && third_column <= 60)); then
    ((range_51_60++))
    elif ((third_column >= 61 && third_column <= 70)); then
    ((range_61_70++))
    elif ((third_column >= 71 && third_column <= 80)); then
    ((range_71_80++))
    elif ((third_column >= 81 && third_column <= 90)); then
    ((range_81_90++))
    elif ((third_column >= 91 && third_column <= 100)); then
    ((range_91_100++))
  fi
done < "$input_file"

# 输出统计结果
echo "0-10: $range_0_10">> "${input_file%.*}"-num.txt
echo "11-20: $range_11_20">> "${input_file%.*}"-num.txt
echo "21-30: $range_21_30">> "${input_file%.*}"-num.txt
echo "31-40: $range_31_40">> "${input_file%.*}"-num.txt
echo "41-50: $range_41_50">> "${input_file%.*}"-num.txt
echo "51-60: $range_51_60">> "${input_file%.*}"-num.txt
echo "61-70: $range_61_70">> "${input_file%.*}"-num.txt
echo "71-80: $range_71_80">> "${input_file%.*}"-num.txt
echo "81-90: $range_81_90">> "${input_file%.*}"-num.txt
echo "91-100: $range_91_100">> "${input_file%.*}"-num.txt
