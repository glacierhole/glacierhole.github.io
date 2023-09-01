#!/bin/bash
inputfile=$1
thisisname=${1%.*}
cd /home/iembs/codonanalysis_main/bin
cp /home/iembs/codonanalysis_main/workplace/$inputfile ./
bash calall.sh $inputfile 
bash imagrade.sh "${inputfile%.*}"-cal.txt
sed -e 's/thisisname/'"$thisisname"'/g' -e 's/thisisfile/'"${thisisname}-cal-num.txt"'/g' barimag.R  > ${thisisname}_barimag.R 
Rscript ${thisisname}_barimag.R
cd /home/iembs/codonanalysis_main/resultplace/
mkdir $thisisname
cd $thisisname
mv /home/iembs/codonanalysis_main/bin/${thisisname}* ./
