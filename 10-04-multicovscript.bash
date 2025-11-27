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
#SBATCH -J multicov_et02b26
#SBATCH --output=outmulticov.out
#SBATCH --error=errmulticov.err
#SBATCH --time=48:00:00   # walltime limit (HH:MM:SS)
# -----------------Load Modules-------------------
module load BEDTools/2.28.0-IGB-gcc-8.2.0

cd /home/a-m/ethayer3/et02b26/workshop/results/consensusfiles

bedtools multicov -bams \
NFR_chromosomal_sortedET_10_rep_1.bam \
NFR_chromosomal_sortedET_10_rep_2.bam \
NFR_chromosomal_sortedET_10_rep_3.bam \
NFR_chromosomal_sortedET_1_rep_1.bam \
NFR_chromosomal_sortedET_1_rep_2.bam \
NFR_chromosomal_sortedET_1_rep_3.bam \
NFR_chromosomal_sortedET_2_rep_1.bam \
NFR_chromosomal_sortedET_2_rep_2.bam \
NFR_chromosomal_sortedET_2_rep_3.bam \
NFR_chromosomal_sortedET_3_rep_1.bam \
NFR_chromosomal_sortedET_3_rep_2.bam \
NFR_chromosomal_sortedET_3_rep_3.bam \
NFR_chromosomal_sortedET_7_rep_1.bam \
NFR_chromosomal_sortedET_7_rep_2.bam \
NFR_chromosomal_sortedET_7_rep_3.bam \
NFR_chromosomal_sortedET_8_rep_1.bam \
NFR_chromosomal_sortedET_8_rep_2.bam \
NFR_chromosomal_sortedET_8_rep_3.bam \
NFR_chromosomal_sortedET_9_rep_1.bam \
NFR_chromosomal_sortedET_9_rep_2.bam \
NFR_chromosomal_sortedET_9_rep_3.bam \
NFR_chromosomal_sortedWT_rep_1_CCTGCGGAAC-AGCCTATGAT.bam \
NFR_chromosomal_sortedWT_rep_2_TGTCGCTGGT-AGTCAGACGA.bam \
NFR_chromosomal_sortedWT_rep_3_GTCCGTAAGC-AAGATACACG.bam \
-bed multiconsensus.bed > consensuscoverage.bam
