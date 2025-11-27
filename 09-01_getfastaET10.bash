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
module load pybedtools/0.9.0-IGB-gcc-8.2.0-Python-3.7.2

# ----------------Commands------------------------
cd /home/a-m/ethayer3/et02b26/workshop/results/mergedfinal
bedtools getfasta -fi \
/home/a-m/ethayer3/et02b26/workshop/reference_data/refdata-gex-GRCh38-2020-A/fasta/genome.fa \
-bed fb_ET10peaks_simple.bed \
-fo fb_ET10peaks_merged_dreme.fasta

