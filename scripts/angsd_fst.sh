#!/bin/bash -l

#SBATCH -D /home/caryn89/Projects/LemmonPBS
#SBATCH -J step_fst_test
#SBATCH -o /home/caryn89/Projects/LemmonPBS/logs/step_test_fst_%j.out
#SBATCH -e /home/caryn89/Projects/LemmonPBS/logs/step_test_fst_%j.out
#SBATCH --time=160:00:00
#SBATCH --mem=80000
#SBATCH -N 1
#SBATCH -n 24

set -u
set -e

###############
#   Set-up    #

fst_config="/home/caryn89/Projects/LemmonPBS/Teo_TDD_FST_Config"

################
#     Main     #

fst_start=`date +%s`

./angsd-wrapper/angsd-wrapper Fst $fst_config
echo $?
fst_end=`date +%s`

((fst_time=$fst_end - $fst_start))
echo angsd fst run time was $fst_time s

