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
#SBATCH -J makingfastaET10_et02b26
#SBATCH --output=makingfastaET10.out
#SBATCH --error=makingfastaET10.err
#SBATCH --time=48:00:00   # walltime limit (HH:MM:SS)
# -----------------Load Modules-------------------
module load FASTX-Toolkit/0.0.14-IGB-gcc-4.9.4

# ----------------Commands------------------------
cd /home/a-m/ethayer3/et02b26/workshop/results/mergedfinal

fastx_collapser	-v -i fb_ET10peaks_merged_dreme.fasta -o collapsed_ET10peaks_dreme.fasta


