#!/bin/bash
# ----------------SLURM Parameters----------------
#SBATCH -p normal
#SBATCH -n 1
#SBATCH --mem=8g
#SBATCH -N 1
#SBATCH --mail-user=ethayer3@illinois.edu
#SBATCH --mail-type=BEGIN
#SBATCH --mail-type=END
#SBATCH --mail-type=FAIL
#SBATCH -J bam_et02b26
#SBATCH --time=48:00:00   # walltime limit (HH:MM:SS)

samtools view -h -S -b \
-o /home/a-m/ethayer3/et02b26/workshop/results/bowtie2/bam/ET_10_rep1_GGCAAGCCAG-CGGATGCTTG_L002.bam \
/home/a-m/ethayer3/et02b26/workshop/results/bowtie2/sam/ET_10_rep1_GGCAAGCCAG-CGGATGCTTG_L002.sam
