#!/bin/bash

dir_Output=/root/chifundo_thesis/results
dir_Hg38=/root/chifundo_thesis/hg38bundle

docker run --rm -v ${dir_Output}:/Output \
        -v ${dir_Hg38}:/Hg38_dir \
	broadinstitute/gatk gatk --java-options "-Xmx4g" Mutect2 \
        -R /Hg38_dir/Homo_sapiens_assembly38.fasta \
        -I /Output/$1/BAM/$1_recal.bam \
        -tumor $1 \
        -I /Output/$2/BAM/$2_recal.bam \
        -normal $2 \
        -pon /Hg38_dir/1000g_pon.hg38.vcf.gz \
        --germline-resource /Hg38_dir/af-only-gnomad.hg38.vcf.gz \
        --af-of-alleles-not-in-resource 0.0000025 \
        -O /Output/$1/$1_m2.vcf.gz

#docker run --rm -v ${dir_GATK}:/data -v ${dir_Output}:/out \
#	broadinstitute/gatk gatk \
#	--java-options "-Xmx8g" GetPileupSummaries \
#	-I /out/$1/BAM/$1_recal.bam \
#	-V /data/small_exac_common_3.hg38.vcf.gz \
#	-O /out/$1/tumor_getpileupsummaries.table

#docker run --rm -v ${dir_GATK}:/data -v ${dir_Output}:/out \
#	broadinstitute/gatk gatk \
#	--java-options "-Xmx8g" CalculateContamination \
#	-I /out/$1/tumor_getpileupsummaries.table \
#	-O /out/$1/tumor_calculatecontamination.table

docker run --rm -v ${dir_Output}:/out \
	broadinstitute/gatk gatk \
	--java-options "-Xmx8g" FilterMutectCalls \
	-V /out/$1/$1_m2.vcf.gz \
	-O /out/$1/$1_m2_filtered.vcf.gz

