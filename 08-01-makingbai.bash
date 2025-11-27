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
#SBATCH -J makingbai_et02b26
#SBATCH --output=makingbai.out
#SBATCH --error=makingbai.err
#SBATCH --time=48:00:00   # walltime limit (HH:MM:SS)
# -----------------Load Modules-------------------
module load SAMtools/1.17-IGB-gcc-8.2.0 
# ----------------Commands------------------------
cd /home/a-m/ethayer3/et02b26/workshop/results/bowtie2/sortedfilteredbam/NFR


for myfile in /home/a-m/ethayer3/et02b26/workshop/results/bowtie2/sortedfilteredbam/NFR/*.bam; do

	samtools index "$myfile" 
	
	echo "$myfile"
done
