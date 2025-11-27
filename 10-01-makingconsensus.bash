#this is what I used to make my multiconsensus bed
cat *.bed | sort -k1,1 -2,2n | bedtools merge > multiconsensus.bed
