#!/bin/bash -l

#SBATCH -D /home/caryn89/Projects/LemmonPBS
#SBATCH -J chr_fst
#SBATCH -o /home/caryn89/Projects/LemmonPBS/logs/chr10_teo_tdd_fst_%j.out
#SBATCH -e /home/caryn89/Projects/LemmonPBS/logs/chr10_teo_tdd_fst_%j.out
#SBATCH --time=96:00:00
#SBATCH --mem=50000
#SBATCH -N 1
#SBATCH -c 24

set -u
set -e

###############
## MODULES
module load samtools

###############
## ENV

chr=10

if [ $chr -eq 11 ]; then chr=Mt; fi
if [ $chr -eq 12 ]; then chr=Pt; fi

#echo array ID: $SLURM_ARRAY_TASK_ID
echo chromsome: $chr

# reference fasta
ftpzip=ftp://ftp.ensemblgenomes.org/pub/plants/release-31/fasta/zea_mays/dna/Zea_mays.AGPv3.31.dna.chromosome.$chr.fa.gz
fazip=Zea_mays.AGPv3.31.dna.chromosome.$chr.fa.gz
fa=Zea_mays.AGPv3.31.dna.chromosome.$chr.fa


# variable for directory
config_dir=chr10test/


# make the region text file
echo $chr: > $config_dir/region.txt

# get the chromosome config file
config=$config_dir/Teo_TDD_FST_Config

# bam info

# I need to change directory for this
bambaseFile=data/bambase.list
bam_num=$(wc -l $bambaseFile)

datadir=data/raw

#for i in `seq 1 16`
#do
#	bambase=$(awk -v var="$i" 'FNR == var {print}' $bambaseFile)
#	sortbam=$datadir/$bambase.sort.bam
#	samtools view -hb $sortbam $chr > $datadir/$bambase.chr$chr.sort.bam
#done


# write the sample lists for each chromosome, for maize and teosinte 

###############
## MAIN

#get the chromosome reference
cd ~/genomes/maize_dna_31
#wget $ftpzip

# unzip fasta
gunzip $fazip

echo samtools index fasta
#generate index
samtools faidx $fa
echo $?

#back to Lemmon 
cd /home/caryn89/Projects/LemmonPBS
pwd
echo $config

echo angsd-wrapper test
angsd-wrapper/angsd-wrapper Fst $config
echo $?

echo $SLURM_JOB_ID $SLURM_ARRAY_TASK_ID $chr $config_dir >> chr10test/fst_chr.info
