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
#SBATCH -J bowtie2_et02b26
#SBATCH --output=bowtie2_alignment_%A_%a.out
#SBATCH --error=bowtie2_alignment_%A_%a.err
#SBATCH --array=1-6
#SBATCH --time=48:00:00   # walltime limit (HH:MM:SS)
# -----------------Load Modules-------------------
module load Bowtie2/2.4.5-IGB-gcc-8.2.0 
module load SAMtools/1.17-IGB-gcc-8.2.0
# ----------------Commands------------------------
#Define the directory containing your files
DIR="/home/a-m/ethayer3/et02b26/workshop/fastqfiles2"
#Get the R1 and R2 file names using the SLURM_ARRAY_TASK_ID
FILE_R1=$(ls $DIR/*_R1_* | sed -n ${SLURM_ARRAY_TASK_ID}p)
FILE_R2=$(ls $DIR/*_R2_* | sed -n ${SLURM_ARRAY_TASK_ID}p)

OUTFILE_STEM=$(basename $FILE_R1 | awk -F '_' '{print $1"_"$2"_"$3"_"$4}')
OUTFILE=/home/a-m/ethayer3/et02b26/workshop/results/bowtie2/bam/${OUTFILE_STEM}.bam

echo "Dir: $DIR"
echo "R1: $FILE_R1"
echo "R2: $FILE_R2"
echo "Outfile: $OUTFILE"

bowtie2	-p 2 --local --very-sensitive \
    -x /home/a-m/ethayer3/et02b26/workshop/bowtie_genome/grch38_1kgmaj \
    -1 $FILE_R1 \
    -2 $FILE_R2 \
    | samtools view -h -S -b > $OUTFILE
