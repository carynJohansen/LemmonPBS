#!/bin/bash -l

#SBATCH -D /home/caryn89/Projects/LemmonPBS
#SBATCH -J tdd_iget
#SBATCH -o /home/caryn89/Projects/LemmonPBS/logs/tdd_%j.out
#SBATCH -e /home/caryn89/Projects/LemmonPBS/logs/tdd_%j.out
#SBATCH --time=9:00:00
#SBATCH --mem=10000
#SBATCH -c 10
#SBATCH --array=1-4

set -u
set -e

module load icommands

bamFile="data/tdd.filelist"

bam=$(awk -v var="$SLURM_ARRAY_TASK_ID" 'FNR == var {print}' $bamFile)
echo $bam

iplant="/iplant/home/shared/panzea/hapmap3/bam/"

echo $iplant$bam

outdir="data/raw"

iget $iplant$bam $outdir



