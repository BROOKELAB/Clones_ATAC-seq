#this is the code I used to make the gtf annotation file into a format that allows me to convert it to a .bed
awk '{ if ($0 ~ "transcript_id") print $0; else print $0" transcript_id \"\";"; }' input.gtf | gtf2bed - > output.bed
