
#!/bin/bash
filesname=(PATHWAY.txt)
for filename in ${filesname[@]}
do
while read line
do
    # 如果不是注释行
        echo $line
    if [[ $line == \>* ]]; then
    # 直接输出
    echo $line >> "${filename%.*}"output.txt 
  else
    # 处理逻辑
    # 3个字母分段
        segments=$(echo $line | fold -w3)
        # 统计个数
        for segment in ${segments[@]}; do
        grep -w -i "$segment" codonset.txt | awk '{print $1, $2, $6}' >>"${filename%.*}"output.txt

        done
  fi
done < $filename
done


