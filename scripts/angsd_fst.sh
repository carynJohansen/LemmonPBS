#!/bin/bash -l

#SBATCH -D /home/caryn89/Projects/LemmonPBS
#SBATCH -J maize_tdd_fst
#SBATCH -o /home/caryn89/Projects/LemmonPBS/logs/maize_tdd_fst_%j.out
#SBATCH -e /home/caryn89/Projects/LemmonPBS/logs/maize_tdd_fst_%j.out
#SBATCH --time=96:00:00
#SBATCH --mem=50000
#SBATCH -N 1
#SBATCH -c 24

set -u
set -e

###############
#   Set-up    #

fst_config="/home/caryn89/Projects/LemmonPBS/Maize_TDD_FST_config"

################
#     Main     #

fst_start=`date +%s`

./angsd-wrapper/angsd-wrapper Fst $fst_config

fst_end=`date +%s`

((fst_time=$fst_end - $fst_start))
echo angsd fst run time was $fst_time s
