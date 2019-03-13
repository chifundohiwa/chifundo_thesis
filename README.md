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
6.create results, fastq, and reference forders in the Chifundo_thesis 
forder to store relevants files 
7.install docker image for allignment
  $docker pull biocontainers/bwa:v0.7.15_cv3 
8.#creating bwa index 
  $chmod -R 777 /root/chifundo_thesis/
  $docker run --rm -v $PWD:/fastq biocontainers/bwa:v0.7.15_cv3 bwa index /fastq/chr19_chr19_KI270866v1_alt.fasta
9.Do alignment
  $bash 01_Alignment.sh ( sample name here without the blankets i.e.7859_GPI)
10.Add all current changes to the next commit in githud (always use git status to know what to do next)
  $git add 
  $git commit -m " message for tracking changes"
  $git push origin master 
