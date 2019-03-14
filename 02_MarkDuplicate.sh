#!/bin/bash

dir_Output=/root/chifundo_thesis/results

docker run --rm -it -v ${dir_Output}:/Output \
	broadinstitute/picard:latest \
	MarkDuplicates \
	CREATE_INDEX=true \
	I=/Output/$1/BAM/$1_sorted.bam \
	O=/Output/$1/BAM/$1_dedupped.bam \
	M=/Output/$1/BAM/$1_dedup_output.metrics




