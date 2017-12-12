#!/bin/bash -l

#SBATCH -D /home/caryn89/Projects/LemmonPBS
#SBATCH -J igetBams
#SBATCH -o /home/caryn89/Projects/LemmonPBS/logs/igetBams_%j.out
#SBATCH -e /home/caryn89/Projects/LemmonPBS/logs/igetBams_%j.out
#SBATCH --time=9:00:00
#SBATCH --mem=50000
#SBATCH --array=1-211

set -u
set -e

#################
# ENV

module load icommands

bamFile="data/selectBams.filelist"

bam=$(awk -v var="$SLURM_ARRAY_TASK_ID" 'FNR == var {print}' $bamFile)

echo $bam

outdir="data/raw/"

iplant="/iplant/home/shared/panzea/hapmap3/bam/"

echo $iplant$bam

##################
## MAIN

quant_start=`date +%s`

iget $iplant$bam $outdir

quant_end=`date +%s`
((quant_time=$quant_end - $quant_start))
echo iget run time was $quant_time s

echo $SLURM_JOB_ID $SLURM_ARRAY_TASK_ID $quant_time $bam >> bam_iget_info.txt
