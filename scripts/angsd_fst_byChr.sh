#!/bin/bash -l

#SBATCH -D /home/caryn89/Projects/LemmonPBS
#SBATCH -J chr_fst
#SBATCH -o /home/caryn89/Projects/LemmonPBS/logs/chr_teo_tdd_fst_%j.out
#SBATCH -e /home/caryn89/Projects/LemmonPBS/logs/chr_teo_tdd_fst_%j.out
#SBATCH --time=96:00:00
#SBATCH --mem=50000
#SBATCH -N 1
#SBATCH -c 24
#SBATCH --array=1-10

set -u
set -e

###############
## ENV

# variable for directory
config_dir=chrom_configs/$SLURM_ARRAY_TASK_ID


# make the region text file
echo $SLURM_ARRAY_TASK_ID: > $config_dir/$SLURM_ARRAY_TASK_ID\_regions.txt

# get the chromosome config file
config=$config_dir/FST_Config

###############
## MAIN

angsd-wrapper/angsd-wrapper FST $config

echo $SLURM_JOB_ID $SLURM_ARRAY_TASK_ID $config_dir
