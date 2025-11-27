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
#SBATCH -J macs2peaks_et02b26
#SBATCH --output=macs2peaks.out
#SBATCH --error=macs2peaks.err
#SBATCH --time=48:00:00   # walltime limit (HH:MM:SS)
# -----------------Load Modules-------------------
module load MACS2/2.2.5-IGB-gcc-8.2.0-Python-3.7.2 
# ----------------Commands------------------------
cd /home/a-m/ethayer3/et02b26/workshop/results/

# Define the directory for output files
out_dir="/home/a-m/ethayer3/et02b26/workshop/results/macs2"

for myfile in /home/a-m/ethayer3/et02b26/workshop/results/bowtie2/sortedfilteredbam/NFR/*.bam; do
    peaks_called="${out_dir}/calledpeaks_$(basename ${myfile})"

    echo "${myfile} -> ${peaks_called}"
    macs2 callpeak -t "$myfile" \
        -c "$myfile" \
        -f BAMPE -g hs --nomodel --keep-dup all --nolambda \
        -n "$(basename ${peaks_called})" \
        --outdir "$out_dir"
done
