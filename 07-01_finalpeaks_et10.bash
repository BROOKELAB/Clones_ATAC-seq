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
#SBATCH -J reps1.2finalpeaksET10_et02b26
#SBATCH --output=reps1.2finalpeaksET10.out
#SBATCH --error=resp1.2finalpeaksET10.err
#SBATCH --time=48:00:00   # walltime limit (HH:MM:SS)
# -----------------Load Modules-------------------
module load pybedtools/0.9.0-IGB-gcc-8.2.0-Python-3.7.2
module load SAMtools/1.17-IGB-gcc-8.2.0 
# ----------------Commands------------------------
cd /home/a-m/ethayer3/et02b26/workshop/results/

bedtools intersect \
-wo -f 0.3 -r \
-a macs2/filteredblacklist/fb_calledpeaks_NFR_chromosomal_sortedET_10_rep_1.bed \
-b macs2/filteredblacklist/fb_calledpeaks_NFR_chromosomal_sortedET_10_rep_2.bed \
> macs2/filteredblacklist/finalpeaks/fb_ET10peaks_reps1.2_final.bed

echo done

