# chifundo_thesis
hello, this is my master thesis working with Dr. Harald.

1.Create new droplet (640GB disk space)
use tmux when working in the droplet
2.install docker,install git by running the following commands
  $apt update
  $apt install git unzip tabix docker.io python-all
3.dont forget to install samtools 
  $apt install samtools
4.get git running 
  $git config --global user.email "chifundohiwa@gmail.com"
  $git config --global user.name "chifundohiwa"
5.get project files from github to the droplet
  $git clone https://github.com/chifundohiwa/chifundo_thesis.git 
6.download Mills_and_1000G_gold_standard.indels.hg38.vcf.gz
7.create results, fastq, and reference forders in the Chifundo_thesis 
  forder to store relevants files 
8.install docker image for allignment
  $docker pull biocontainers/bwa:v0.7.15_cv3 
9.#creating bwa index 
  $chmod -R 777 /root/chifundo_thesis/
  $docker run --rm -v $PWD:/fastq biocontainers/bwa:v0.7.15_cv3 bwa index /fastq/chr19_chr19_KI270866v1_alt.fasta
  This process will take atleast 2hours to complete
10.Do alignment
   customise the alignment file to fit the samples and correct docker picture version used. in this case i used biocontainers/ bwa:v0.7.15_cv3
   #$1 is used as a substite for sample name
   $bash 01_Alignment.sh ( sample name here without the blankets i.e.2019_SN6)
   This process will take about 18hrs + dependent on how big the file is.
11.check results file to contain a BAM and a LOG folder. 
   The BAM folder should contain "solted bam file"  
12.4Add all current changes to the next commit in githud (always use git status to know what to do next)
   $git add 
   $git commit -m " message for tracking changes"
   $git push origin master 
13.The reference forder at this point should contain 6 files, the original fasta file, .bwt;.pac; .sa; .ann; .amb 
14.Run the MarkedDuplicates step to produce name__dedup_output.metrics name__dedupped.bai  name__dedupped.bam 
   $bash 02_MarkedDuplicates.sh ( sample name here without the blankets i.e.2019_SN1)
   The result from this process wil be a dedupped.bam,dedupped.bai, and dedup_output.metrics 
15.The proceeding is recalibration. To recalibrate we need to have a dic file and a .fai file together with that fasta file. 
   $docker run --rm -v $PWD:/data broadinstitute/gatk:4.0.2.1 gatk CreateSequenceDictionary -R /data/hg38bundle/Homo_sapiens_assembly38.fasta
   $samtools faidx hg38bundle/Homo_sapiens_assembly38.fasta
   $bash 03_recalibration.sh (sample name here without the blankets i.e.2019_SP1)
   This process will take atleast 4hour to run 

16.

