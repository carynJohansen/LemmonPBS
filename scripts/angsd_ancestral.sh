#!/bin/bash -l

#SBATCH -D /home/caryn89/Projects/LemmonPBS
#SBATCH -J ancestral
#SBATCH -o /home/caryn89/Projects/LemmonPBS/logs/ancestral_%j.out
#SBATCH -e /home/caryn89/Projects/LemmonPBS/logs/ancestral_%j.out
#SBATCH --time=5:00:00
#SBATCH --mem=22000
#SBATCH -c 24

set -u
set -e

#######
# ENV #

config="/home/caryn89/Projects/LemmonPBS/configs/Ancestral_Sequence_Config"

########
# DATA #


########
# MAIN #

start=`date +%s`

angsd-wrapper/angsd-wrapper Ancestral $config

end=`date +%s`
((t=$end - $start))

echo ancestral angsd wrapper took $t seconds

