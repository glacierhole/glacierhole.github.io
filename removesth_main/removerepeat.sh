#!/bin/bash
inputfile=$1
declare -A seen_headers

while read line; do
  if [[ $line == \>* ]]; then
    if [[ ${seen_headers[$line]} ]]; then
      skip_sequence=true
    else
      skip_sequence=false  
      seen_headers[$line]=1 
      echo $line >>"${inputfile%.*}"-norepeat.txt
    fi

  elif ! $skip_sequence; then
    echo $line >>"${inputfile%.*}"-norepeat.txt
  fi

done < $inputfile
