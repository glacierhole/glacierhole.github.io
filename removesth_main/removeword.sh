
#!/bin/bash
inputword="reductase"
inputfile=$1
skip_sequence=false

while read line; do
  if [[ $line == \>* ]]; then
    if [[ $line =~ "$inputword" ]]; then
      skip_sequence=true
    else
      skip_sequence=false
      echo $line >> "${inputfile%.*}"-reductase.txt
    fi

  elif ! $skip_sequence; then
    echo $line >> "${inputfile%.*}"-reductase.txt
 
  fi

done < $inputfile
