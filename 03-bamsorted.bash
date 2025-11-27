#!/bin/bash
# ----------------SLURM Parameters----------------
#SBATCH -p normal
#SBATCH -n 2
#SBATCH --mem=10g
#SBATCH -N 2
#SBATCH --mail-user=ethayer3@illinois.edu
#SBATCH --mail-type=BEGIN
#SBATCH --mail-type=END
#SBATCH --mail-type=FAIL
#SBATCH -J bamsort_et02b26
#SBATCH --output=bamsort_%A_%a.out
#SBATCH --error=bamsort_%A_%a.err
#SBATCH --array=1-24%6
#SBATCH --time=48:00:00   # walltime limit (HH:MM:SS)
# -----------------Load Modules-------------------
module load SAMtools/1.17-IGB-gcc-8.2.0
module load sambamba/0.8.0 
# ----------------Commands------------------------
#Define the directory containing your files
DIR="/home/a-m/ethayer3/et02b26/workshop/results/bowtie2/bam"
#Get the file names using the SLURM_ARRAY_TASK_ID
FILE_R1=$(ls $DIR/*_rep_* | sed -n ${SLURM_ARRAY_TASK_ID}p)

OUTFILE_STEM=$(basename $FILE_R1 | awk -F '_' '{print $1"_"$2"_"$3"_"$4}')
OUTFILE=/home/a-m/ethayer3/et02b26/workshop/results/bowtie2/sortedbam/${OUTFILE_STEM}.bam

echo "Dir: $DIR"
echo "R1: $FILE_R1"
echo "Outfile: $OUTFILE"

samtools sort $FILE_R1 -o $OUTFILE
