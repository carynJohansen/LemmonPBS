#!/bin/bash -l

#SBATCH -D /home/caryn89/Projects/LemmonPBS/data/raw
#SBATCH -J sortIndex
#SBATCH -o /home/caryn89/Projects/LemmonPBS/logs/sortIndex_%j.out
#SBATCH -e /home/caryn89/Projects/LemmonPBS/logs/sortIndex_%j.out
#SBATCH --time=9:00:00
#SBATCH --mem=50000
#SBATCH --array=1-16

set -u
set -e

#############
# ENV

module load samtools/1.3.1

bamFile="../combinedBams.filelist"

bambaseFile="../bambase.list"

bam=$(awk -v var="$SLURM_ARRAY_TASK_ID" 'FNR == var {print}' $bamFile)

bambase=$(awk -v var="$SLURM_ARRAY_TASK_ID" 'FNR == var {print}' $bambaseFile)

sortbam=$bambase.sort.bam

echo $bam
echo $bambase
echo $sortbam

pwd

##################
# MAIN

bam_start=`date +%s`

samtools sort $bam $sortbam
samtools index $sortbam

bam_end=`date +%s`
((bam_time=$bam_end - $bam_start))
echo samtools sort and index took $bam_time s

echo $SLURM_JOB_ID $SLURM_ARRAY_TASK_ID $bam_time $bam >> bam_sort_idx.info

