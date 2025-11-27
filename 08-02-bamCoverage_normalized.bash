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
#SBATCH -J bamCoverage2_et02b26
#SBATCH --output=bamCoverage2.out
#SBATCH --error=bamCoverage2.err
#SBATCH --time=48:00:00   # walltime limit (HH:MM:SS)
# -----------------Load Modules-------------------
module load deepTools/3.5.2-IGB-gcc-8.2.0-Python-3.7.2 
# ----------------Commands------------------------
cd /home/a-m/ethayer3/et02b26/workshop/results/bowtie2/sortedfilteredbam/

# Define the directory for output files
out_dir="/home/a-m/ethayer3/et02b26/workshop/results/visualization/bigWig"
for myfile in /home/a-m/ethayer3/et02b26/workshop/results/bowtie2/sortedfilteredbam/NFR/*.bam; do

	bamCoverage -b "$myfile" \
        -o "${out_dir}/bw2_$(basename ${myfile}).bw" \
        --binSize 20
	--normalizeUsing CPM

	echo "$myfile"

done
