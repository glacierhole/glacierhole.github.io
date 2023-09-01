
#!/bin/bash
seqfile="seq.txt"
while read line; do
# 如果不是注释行
if [[ ! $line == \>* ]]; then
# 3个字母分段
segments=$(echo $line | fold -w3)  
# 统计个数
for segment in $segments; do
grep -w -i "$segment" codonset.txt | awk '{print $1, $2, $6}' >>output.txt
done
fi
done < seq.txt

