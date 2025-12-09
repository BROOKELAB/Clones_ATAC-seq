# Clones_ATAC-seq
_ATAC-seq analysis for the A549 clonal populations_\
Scripts associated with the ATAC-seq data in Single-cell heterogeneity in interferon induction potential is heritable and governed by variation in cell state, Thayer et al. (2025).

## Overview
This repository contains the scripts (or templates of scripts) used to process the ATAC-seq data collected from clonal A549 populations. Some scripts are used for each clonal population and are therefore reused; in such cases, the script shown will serve as an example/template for that step in the process. The majority of the pipeline is following the instructions from https://github.com/hbctraining/Investigating-chromatin-biology-ChIPseq/tree/main/lessons. 

### Processing Pipeline Includes
:white_check_mark: Aligment with Bowtie2\
:white_check_mark: .sam to .bam conversion\
:white_check_mark: Sort BAM files by genomic coordinates\
:white_check_mark: Filter the unmapped and duplicated reads\
:white_check_mark: Calling peaks with MACS2\
:white_check_mark: Making consensus peak files for the replicates and performing more filtering\
:white_check_mark: Creating bigWig files for visualization\
:white_check_mark: Creating an annotated peak count matrix for all of the samples in one .bed file which can be converted to .txt

### In addition to the processing pipeline
There is a .Rmd file that contains the downstrean analysis of the ATAC data using the peak count matrix. You will need:
* edgeR
* TxDb.Hsapiens.UCSC.hg38.knownGene
* dplyr
* tidyr
* ggplot2
* InTAD
* tibble
* org.Hs.eg.db

