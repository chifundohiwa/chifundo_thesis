#bcftools concat -o total_chroms.vcf 2019_SP6_m2_chr1_filtered.vcf.gz 2019_SP6_m2_chr2_filtered.vcf.gz 2019_SP6_m2_chr3_filtered.vcf.gz ... 2019_SP6_m2_chr22_filtered.vcf.gz
date
echo "combining vcf"
zcat *filtered.vcf.gz |grep -v '#' > combined.vcf
echo "preparing header"
zcat 2019_SP6_m2_chr2_filtered.vcf.gz |grep '^#' >head.vcf
echo "adding header"
cat head.vcf combined.vcf > combined_final.vcf
echo "removing info"
cat combined_final.vcf|cut -f1-7 > SP6_final.vcf
gzip SP6_final.vcf
echo "finished"
date

