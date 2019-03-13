echo "working in current directory" 
pwd
# Use the faidx option of Samtools to subset the ALT contig sequence to a new FASTA file, chr19_KI270866v1_alt.fasta.
samtools faidx chr19_chr19_KI270866v1_alt.fasta chr19_KI270866v1_alt > chr19_KI270866v1_alt.fasta
## Generate simulated reads from chr19_KI270866v1_alt.fasta with the following command.
dwgsim -1151 -2151 -d500 -r0.0010 -e0 -N10000 -R0 -X0 chr19_KI270866v1_alt.fasta 7859_GPI.read1.fq 7859_GPI.read2.fq
##creating bwa index
bwa index chr19_chr19_KI270866v1_alt.fasta
## alignment using bwa
bwa mem chr19_chr19_KI270866v1_alt.fasta 7859_GPI.read1.fq 7859_GPI.read2.fq > 8017_bwamem.sam
##changing from SAM to BAM file
samtools view -bT chr19_chr19_KI270866v1_alt.fasta 8017_bwamem.sam > sequence1.bam 



