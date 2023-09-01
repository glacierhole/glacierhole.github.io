
#!/bin/bash
inputfile=$1
gene=""
content=""

while read line; do
  if [[ $line == \>* ]]; then
    if [ -n "$gene" ]; then
      echo "$gene" >> "${inputfile%.*}".txt
      echo "${content// /}" >> "${inputfile%.*}".txt

      gene=""
      content=""
    fi
    gene="$line"
  else
    content+=" $line"
  fi
done < $inputfile
