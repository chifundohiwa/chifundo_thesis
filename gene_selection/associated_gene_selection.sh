echo "running in current working directory $PWD"
date
echo "selecting target genes"
#python multiple_search.py ($1 main vcf file) ($2 key file with list of genes to be selectected)
#python multiple_search.py $1 $2
#echo "removing empty lines"
#cat output.csv|grep -v '^$' > associated_gene_selection.csv
#rm output.csv
#echo "results writen to associated_gene_selection.csv"
#using a txt file with the script below coz its easier to get the hearder from the txt than vcf
cat $1 |grep -w "Gene" > file_header.txt
echo "Header"
cat file1.txt|wc -l
cat $1 |grep -w "EGFR" > file1.txt
echo "EGFR"
cat file1.txt|wc -l
cat $1 |grep -w "PTEN" > file2.txt
echo "PTEN"
cat file2.txt|wc -l
cat $1 |grep -w "BIM" > file3.txt
echo "BIM"
cat file3.txt|wc -l
cat $1 |grep -w "CRIPTO1" > file4.txt
echo "CRIPTO1"
cat file4.txt|wc -l
cat $1 |grep -w "PIK3CA" > file5.txt
echo "PIK3CA"
cat file5.txt|wc -l
cat $1 |grep -w "MET" > file6.txt
echo "MET"
cat file6.txt|wc -l
cat $1 |grep -w "HER2" > file7.txt
echo "HER2"
cat file7.txt|wc -l
cat $1 |grep -w "IGF-1R" > file8.txt
echo "IGF-1R"
cat file8.txt|wc -l
cat $1 |grep -w "HGF" > file9.txt
echo "HGF"
cat file9.txt|wc -l
cat $1 |grep -w "RelA" > file10.txt
echo "RelA"
cat file10.txt|wc -l
cat $1 |grep -w "CFLAR" > file11.txt
echo "CFLAR"
cat file11.txt|wc -l
cat $1 |grep -w "NFKBIA" > file12.txt
echo "NFKBIA"
cat file12.txt|wc -l
cat $1 |grep -w "ALK" > file13.txt
echo "ALK"
cat file13.txt|wc -l
cat $1 |grep -w "NOTCH3" > file14.txt
echo "NOTCH3"
cat file14.txt|wc -l
cat $1 |grep -w "PSEN1" > file15.txt
echo "PSEN1"
cat file15.txt|wc -l
cat $1 |grep -w "NCSTN" > file16.txt
echo "NCSTN"
cat file16.txt|wc -l
cat $1 |grep -w "PEN-2" > file17.txt
echo "PEN-2"
cat file17.txt|wc -l
cat file_header.txt file1.txt file2.txt file3.txt file4.txt file5.txt file6.txt file7.txt file8.txt file9.txt file10.txt file11.txt file12.txt file13.txt file14.txt file15.txt file16.txt file17.txt > combined_genes.txt
echo "Finished.Saved in combined_genes.txt"

