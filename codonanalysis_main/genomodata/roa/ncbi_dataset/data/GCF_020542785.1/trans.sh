
#!/bin/bash

gene=""
content=""

while read line; do
  if [[ $line == \>* ]]; then
    if [ -n "$gene" ]; then
      echo "$gene" >> cds_from_genomic.txt
      echo "${content// /}" >> cds_from_genomic.txt
      gene=""
      content=""
    fi
    gene="$line"
  else
    content+=" $line"
  fi
done < cds_from_genomic.fna 


