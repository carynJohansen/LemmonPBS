#!/bin/bash -l

#SBATCH -D /home/caryn89/Projects/LemmonPBS
#SBATCH -J sfs
#SBATCH -o /home/caryn89/Projects/LemmonPBS/logs/sfs_%j.out
#SBATCH -e /home/caryn89/Projects/LemmonPBS/logs/sfs_%j.out
#SBATCH --time=24:00:00
#SBATCH -c 24
#SBATCH --mem=50000

set -u
set -e

config="/home/caryn89/Projects/LemmonPBS/configs/Site_Frequency_Spectrum_Config"

start=`date +%s`

./angsd-wrapper/angsd-wrapper SFS $config
echo $?

end=`date +%s`
((t= $end - $start))
echo angsd sfs took $t seconds

