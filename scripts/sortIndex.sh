#!/bin/bash -l

#SBATCH -D /home/caryn89/Projects/LemmonPBS/data/raw
#SBATCH -J sortIndex
#SBATCH -o /home/caryn89/Projects/LemmonPBS/logs/sortIndex_%j.out
#SBATCH -e /home/caryn89/Projects/LemmonPBS/logs/sortIndex_%j.out
#SBATCH --time=9:00:00
#SBATCH --mem=50000
#SBATCH --array=1-15

set -u
set -e

#############
# ENV

module load samtools/1.3.1

bamFile="../combinedBams.filelist"

bam=$(awk -v var="$SLURM_ARRAY_TASK_ID" 'FNR == var {print}' $bamFile)



echo $bam

pwd

##################
# MAIN

bam_start=`date +%s`

samtools sort $bam
samtools index $bam

bam_end=`date +%s`
((bam_time=$bam_end - $bam_start))
echo samtools sort and index took $bam_time s

echo $SLURM_JOB_ID $SLURM_ARRAY_TASK_ID $bam_time $bam >> bam_sort_idx.info

