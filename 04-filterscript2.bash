#!/bin/bash
# ----------------SLURM Parameters----------------
#SBATCH -p normal
#SBATCH -n 6
#SBATCH --mem=4g
#SBATCH -N 1

NTHREADS=6
set -x
set -e

module load SAMtools/1.17-IGB-gcc-8.2.0
module load Bowtie2/2.5.3-IGB-gcc-8.2.0
module load sambamba/0.8.0

# results/bowtie2/sortedbam/sortedET_10_rep_1.bam
target_dir=results/bowtie2/sortedfilteredbam

mkdir -p ${target_dir}

for myfile in results/bowtie2/sortedbam/*.bam; do
    deduplicated="${target_dir}/filtered_$(basename ${myfile})"
    chromosomal="${target_dir}/f_chromosomal_$(basename ${myfile})"
    nfr_chromosomal="${target_dir}/NFR_chromosomal_$(basename ${myfile})"

    echo "${myfile} -> ${deduplicated}"
    sambamba view -h -t 2 -f bam \
        -F "[XS] == null and not unmapped and not duplicate" \
        ${myfile} > ${deduplicated}

    echo "${deduplicated} -> ${chromosomal}"
    samtools view -h ${deduplicated}  | \
        awk '{if($3 != "*" && $3 != "chrM"){print $0}}' | \
        samtools view -Shb - > ${chromosomal}

    echo "${chromosomal} -> ${nfr_chromosomal}"
    sambamba view --format \
        bam --nthreads $NTHREADS \
        -F "((template_length > 0 and template_length < 120) or (template_length < 0 and template_length > -120))" \
        ${chromosomal} | \
        samtools view -b > ${nfr_chromosomal}
done
# OTPUT FROM HERE > TO THIS FILE
# OTPUT FROM HERE >> APPEND TO THIS FILE
 
