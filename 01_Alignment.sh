#!/bin/bash

dir_fastq=/root/chifundo_thesis/fastq
dir_Output=/root/chifundo_thesis/results
dir_Hg38=/root/chifundo_thesis/hg38bundle

mkdir -p ${dir_Output}/$1
mkdir -p ${dir_Output}/$1/{LOG,BAM}

docker run --rm -v ${dir_fastq}:/fastq -v ${dir_Hg38}:/reference biocontainers/bwa:v0.7.15_cv3 \
	bwa mem \
	-t 7 \
	-R "@RG\tID:$1\tSM:$1\tPL:Illumina\tLB:WES" \
	/reference/chr19_chr19_KI270866v1_alt.fasta \
	/fastq/$1.read1.fq \
	/fastq/$1.read2.fq \
	| samtools sort -o ${dir_Output}/$1/BAM/$1_sorted.bam
