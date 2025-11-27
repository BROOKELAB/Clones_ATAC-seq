#!/bin/bash
# ----------------SLURM Parameters----------------
#SBATCH -p normal
#SBATCH -n 2
#SBATCH --mem=8g
#SBATCH -N 1
#SBATCH --mail-user=ethayer3@illinois.edu
#SBATCH --mail-type=BEGIN
#SBATCH --mail-type=END
#SBATCH --mail-type=FAIL
#SBATCH -J filteringblacklist_et02b26
#SBATCH --output=filteringblacklist.out
#SBATCH --error=filteringblacklist.err
#SBATCH --time=48:00:00   # walltime limit (HH:MM:SS)
# -----------------Load Modules-------------------
module load pybedtools/0.9.0-IGB-gcc-8.2.0-Python-3.7.2
module load SAMtools/1.17-IGB-gcc-8.2.0 
# ----------------Commands------------------------
cd /home/a-m/ethayer3/et02b26/workshop/results

for myfile in /home/a-m/ethayer3/et02b26/workshop/results/macs2/*.bam_summits.bed; do
	basename=$(basename  "${myfile}" .bam_summits.bed)
	echo "$basename"
	echo "$basename.bam_peaks.narrowPeak"
	bedtools intersect \
	-v \
	-a macs2/$basename.bam_peaks.narrowPeak \
	-b /home/a-m/ethayer3/et02b26/workshop/reference_data/hg38-blacklist.v2.bed \
	> macs2/filteredblacklist/fb_$basename.bed
done

