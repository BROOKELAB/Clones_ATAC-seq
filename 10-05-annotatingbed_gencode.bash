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
#SBATCH -J annotatingbed_gencode_et02b26
#SBATCH --output=outannotating_gencode.out
#SBATCH --error=errannotating_gencode.err
#SBATCH --time=48:00:00   # walltime limit (HH:MM:SS)
# -----------------Load Modules-------------------
module load pybedtools/0.9.0-IGB-gcc-8.2.0-Python-3.7.2


cd /home/a-m/ethayer3/et02b26/workshop/results/consensusfiles

bedtools closest \
-D b \
-t first \
-a multiconsensus-simple.bed \
-b gencode.v38.annotation.bed \
> annotatedbed5.bed

 
