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
#SBATCH -J bamtobed_et02b26
#SBATCH --output=outbamtobed.out
#SBATCH --error=errbamtobed.err
#SBATCH --time=48:00:00   # walltime limit (HH:MM:SS)
# -----------------Load Modules-------------------
module load pybedtools/0.9.0-IGB-gcc-8.2.0-Python-3.7.2


cd /home/a-m/ethayer3/et02b26/workshop/results/consensusfiles

bedtools bamtobed \
-i consensuscoverage.bam \
> consensuscoverage.bed

 
