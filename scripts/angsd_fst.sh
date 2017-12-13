#!/bin/bash -l

#SBATCH -D /home/caryn89/Projects/LemmonPBS
#SBATCH -J region10
#SBATCH -o /home/caryn89/Projects/LemmonPBS/logs/region_teo_fst_%j.out
#SBATCH -e /home/caryn89/Projects/LemmonPBS/logs/region_teo_fst_%j.out
#SBATCH --time=96:00:00
#SBATCH --mem=50000
#SBATCH -N 1
#SBATCH -c 24

set -u
set -e

###############
#   Set-up    #

fst_config="/home/caryn89/Projects/LemmonPBS/Teo_TDD_FST_Config"

################
#     Main     #

fst_start=`date +%s`

./angsd-wrapper/angsd-wrapper Fst $fst_config

fst_end=`date +%s`

((fst_time=$fst_end - $fst_start))
echo angsd fst run time was $fst_time s
