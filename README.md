# Population Branch Statistic

on Lemmon et al. data

The purpose of this project is to calculate the population branch statistic between maize and teosinte using tripsicum as an outgroup.

For loop to copy FST_Config files into chrom_config files, for have unique FST_Config files for each configs: 

for i in `seq 1 10`;
do
	cp angsd-wrapper/Configuration_Files/FST_Config chrom_cofigs/$i/
done

angsd-wrapper was installed locally from: https://github.com/mojaveazure/angsd-wrapper/wiki/Tutorial

Directory overview:

* angsd-wrapper/ 	==> the locally installed angsd-wrapper
* bam_iget_info.txt 	==> bash output infor for the script: scripts/iget_bams.sh
* chr10test 		==> test to run angsd-wrapper on just chromosome 10
* chr_fst.info 		==> bash information output for the script: scripts/angsd_fst_byChr.sh
* chrom_configs/	==> angsd config files for each chromsome
* configs/		==> edited config files for angsd-wrapper scripts
* data/			==> raw and processed data, and files containing lists of file names for angsd-wrapper
* inbreeding.indF	==> inbreeding values for all maize and teosinte samples
* logs/			==> all script outputs
* Maize_TDD_Common_Config ==> Common config for angsd-wrapper for FST between maize and tripsicum
* Maize_TDD_FST_config	==> FST config for angsd-wrapper for FST between maize and tripsicum
* README.md		==> read me file
* results/		==> parent directory for all results
* scripts/		==> parent directory for all bash scripts
* Teo_TDD_Common_Configs ==> Common config for angsd-wrapper for FST between teosinte and tripsicum
* Teo_TDD_FST_Configs	==> FST config for angsd-wrapper for FST between teosinte and tripsicum
* test_Common_Config	==> test common config for angsd-wrapper
* test_FST_Config	==> test FST onfig for angsd-wrapper

## Directory details:

```
├── angsd-wrapper
│   ├── Configuration_Files
│   ├── dependencies
│   ├── Example_Data
│   ├── shinyGraphing
│   └── Wrappers
├── chr10test
│   └── Teo_TDD
├── chrom_configs
│   ├── 1
│   ├── 10
│   ├── 2
│   ├── 3
│   ├── 4
│   ├── 5
│   ├── 6
│   ├── 7
│   ├── 8
│   └── 9
├── configs
├── data
│   ├── processed
│   └── raw
├── logs
│   └── old
├── results
│   ├── StepTest
│   ├── Teo_TDD
│   └── TeoTest
└── scripts
```

### angsd_wrapper

locally installed angsd_wrapper. For more, go to: https://github.com/mojaveazure/angsd-wrapper/wiki/Tutorial

Check out the Example_Data for examples.

My work flow with this is to make copies of the Configuration files and keep the original ones here.

### chr10test/

```
chr10test/
├── angsd_fst_byChr.sh
├── maize.indF
├── maize_samples.txt
├── Maize_TDD_Common_Config
├── Maize_TDD_FST_config
├── region.txt
├── tdd.indF
├── tdd_sample.txt
├── teo.indF
├── teo_sample.txt
├── Teo_TDD
│   └── Fst
├── Teo_TDD_Common_Config
├── Teo_TDD_FST_Config
├── teo_tdd.indF
└── teo_tdd_samples.txt
```

* angsd_fst_byChr.sh			- script for running angsd on a chromosome
* XXX.indF				- inbreeding coeficient for angsd
* maize_samples.txt			- paths to sample bam file
* Maize_TDD_Common_Config		- config for maize-TDD comparison
* Maize_TDD_FST_config			- FST config for maize-TDD comparison
* region.txt				- region file for angsd
* tdd.indF				- tripsicum inbreeding coefficient for angsd
* tdd_sample.txt			- tripsicum sample file with paths to bam files
* teo.indF				- teosinte inbreeding coefficient file
* teo_sample.txt			- paths to teosinte bam files
* Teo_TDD_Common_Config			- configuration file for teosinte-tripsicum comparison
* Teo_TDD_FST_Config			- FST configuation file for teosinte-tripsicum comparison
* teo_tdd.indF				- inbreeding coefficient file for teo-tripsicum comparison
* teo_tdd_samples.txt			- paths to bam files for teo-tripsicum comparison

### Teo_TDD

```
Teo_TDD
└── Fst
    ├── 2DSFS_Intergenic.Tripsicum.Teosinte.sfs
    ├── Teosinte_Intergenic.arg
    ├── Tripsicum_Intergenic.arg
    ├── Tripsicum_Intergenic.mafs.gz
    ├── Tripsicum_Intergenic.saf.gz
    ├── Tripsicum_Intergenic.saf.idx
    ├── Tripsicum_Intergenic.saf.pos.gz
    ├── Tripsicum.Teosinte.fst.global
    └── Tripsicum.Teosinte.fst.slidingwindow
```

Result output from angsd_wrapper for the teosinte-tripsicum comparison

## chrom_configs/

configuration files for each of the chromosomes.

I did not yet run angsd-wrapper on all the chromosomes. I was testing out the scripts and the analysis on chromosome 10 in `chr10test/` before I commited to all cchromosomes.

## configs/

The configuration and axillary files for running angsd-wrapper on a genome-wide scale.

**Issues I was currently having**

The main issue was space and configuring angsd-wrapper to use resources properly. I was about to begin troubleshooting this. As far as I could tell, ansgd-wrapper was using only 1 CPU even when told to use the maximum amount available in a node. You would need to wort that out to run the whole genome analysis (and probably the chromosome analysis) reasonably.

## data/

```
data/
├── bambase.list
├── combinedBams.filelist
├── processed
├── raw
├── samples.filelist
├── selectBams.filelist
└── tdd.filelist
```

Files:

* bambase.list				- the base names of the bam files - for looping and identifying samples in shell scripts
* combinedBams.filelist			- another list of bams for a shell script
* samples.filelist			- list of all sample bam files in the raw data folder
* selectBams.filelist			- to full raw list of bams you get when you pull the whole data set from panzea
* tdd.filelist				- tripsicum was a separate download

### data/processed

messing with the tripsicum fasta - trying to get rid of all scaffolds. Didn't use the chromosome-only output (chrom_only.txt)

### data/raw

All the sorted bam files and indexes for the analysis. Including chromosome 10 removed from each chromosome for `chr10test/`

## logs/

Log output for all angsd attemps. Leaving here for debugging.

## results/

```
results/
├── StepTest
│   └── Fst
│       ├── 2DSFS_Intergenic.Tripsicum.Teosinte.sfs
│       ├── Teosinte_Intergenic.arg
│       ├── Teosinte_Intergenic.mafs.gz
│       ├── Teosinte_Intergenic.saf.gz
│       ├── Teosinte_Intergenic.saf.idx
│       ├── Teosinte_Intergenic.saf.pos.gz
│       ├── Tripsicum_Intergenic.arg
│       ├── Tripsicum_Intergenic.mafs.gz
│       ├── Tripsicum_Intergenic.saf.gz
│       ├── Tripsicum_Intergenic.saf.idx
│       ├── Tripsicum_Intergenic.saf.pos.gz
│       ├── Tripsicum.Teosinte.fst.global
│       ├── Tripsicum.Teosinte.fst.gz
│       ├── Tripsicum.Teosinte.fst.idx
│       └── Tripsicum.Teosinte.fst.slidingwindow
├── Teo_TDD
│   ├── angsd_fst.sh
│   ├── Fst
│   │   ├── Teosinte_Intergenic.arg
│   │   ├── Teosinte_Intergenic.mafs.gz
│   │   ├── Teosinte_Intergenic.saf.gz
│   │   ├── Teosinte_Intergenic.saf.idx
│   │   ├── Teosinte_Intergenic.saf.pos.gz
│   │   ├── Tripsicum_Intergenic.arg
│   │   ├── Tripsicum_Intergenic.mafs.gz
│   │   ├── Tripsicum_Intergenic.saf.gz
│   │   ├── Tripsicum_Intergenic.saf.idx
│   │   └── Tripsicum_Intergenic.saf.pos.gz
│   ├── Teo_TDD_Common_Config
│   └── Teo_TDD_FST_Config
└── TeoTest
    ├── angsd_fst.sh
    └── Fst
        ├── 2DSFS_Intergenic.Tripsicum.Teosinte.sfs
        ├── Teosinte_Intergenic.arg
        ├── Teosinte_Intergenic.mafs.gz
        ├── Teosinte_Intergenic.saf.gz
        ├── Teosinte_Intergenic.saf.idx
        ├── Teosinte_Intergenic.saf.pos.gz
        ├── Tripsicum_Intergenic.arg
        ├── Tripsicum_Intergenic.mafs.gz
        ├── Tripsicum_Intergenic.saf.gz
        ├── Tripsicum_Intergenic.saf.idx
        ├── Tripsicum_Intergenic.saf.pos.gz
        ├── Tripsicum.Teosinte.fst.global
        ├── Tripsicum.Teosinte.fst.gz
        ├── Tripsicum.Teosinte.fst.idx
        └── Tripsicum.Teosinte.fst.slidingwindow
```

The output for all ansgd_wrapper runs. The Common_configuration file sets this directory as the output. Then the name of each test is the next step down.

I also started putting the specific script for that angsd_wrapper run into the results, so that I can keep a record of exactly what happened. I also did this for the configuration files for `Teo_TDD/`

* StepTest/					- I think testing a different step size on a genome-wide scan
* Teo_TDD/					- genome-wide scan for teosinte-tripsicum comparison
* TeoTest/					- genome-wdie scan for teosine-tripsicum comparison, different configurations

## scripts/

```
scripts/
├── angsd_ancestral.sh
├── angsd_fst_byChr.sh
├── angsd_fst.sh
├── angsd_sfs.sh
├── combineBams.sh
├── iget_bams.sh
├── sortIndex.sh
├── sra_tdd.sh
└── tdd_iget.sh
```

* angsd_ancestral.sh				- testing the Ancestral feature of angsd-wrapper
* angsd_fst_byChr.sh				- calculate FST by chromosome - may throw error
* angsd_fst.sh					- working scrupt to calculate FST genome-wide
* angsd_sfs.sh					- working script to calculate SFS genome-wide
* combineBams.sh				- hideous script to combine bams - hardcoded and relaly awful and embarrassing
* iget_bams.sh					- use iget to fetch bam files from iplant
* sortIndex.sh					- samtools to sort and index all bam files
* sra_tdd.sh					- get tripsicum fasta from SRA
* tdd_iget.sh					- use this one: get trpsicum bam file from iplant



### Complete Project Tree

```
.
├── angsd-wrapper
│   ├── angsd-wrapper
│   ├── Configuration_Files
│   │   ├── Abbababa_Config
│   │   ├── Admixture_Config
│   │   ├── Ancestral_Sequence_Config
│   │   ├── Common_Config
│   │   ├── FST_Config
│   │   ├── Genotype_Config
│   │   ├── Inbreeding_Coefficients_Config
│   │   ├── Principal_Component_Analysis_Config
│   │   ├── Site_Frequency_Spectrum_Config
│   │   └── Thetas_Config
│   ├── LICENSE
│   ├── README.md
│   ├── shinyGraphing
│   │   ├── abbababa.test
│   │   ├── all.pop.covar
│   │   ├── BKN_Diversity.thetas.gz.pestPG
│   │   ├── ngsadmix_example.txt
│   │   ├── output_barley1_PH_DerivedSFS
│   │   ├── server.R
│   │   ├── sfs_example.txt
│   │   ├── ui.R
│   │   └── Zea_mays.AGPv3.23.chromosome.10.gff3.gz
│   └── Wrappers
│       ├── Abbababa.sh
│       ├── Admixture.sh
│       ├── Ancestral_Sequence.sh
│       ├── convertSFS.R
│       ├── fst_bp.R
│       ├── FST.sh
│       ├── Genotypes.sh
│       ├── Help.sh
│       ├── Inbreeding_Coefficients.sh
│       ├── Principal_Component_Analysis.sh
│       ├── Setup.sh
│       ├── Site_Frequency_Spectrum.sh
│       ├── sortRegions.R
│       ├── startShiny.R
│       ├── test.sh
│       ├── thetas_filtering.R
│       ├── Thetas.sh
│       ├── variable_definitions
│       └── writeConfigs.sh
├── bam_iget_info.txt
├── chr10test
│   ├── angsd_fst_byChr.sh
│   ├── maize.indF
│   ├── maize_samples.txt
│   ├── Maize_TDD_Common_Config
│   ├── Maize_TDD_FST_config
│   ├── region.txt
│   ├── tdd.indF
│   ├── tdd_sample.txt
│   ├── teo.indF
│   ├── teo_sample.txt
│   ├── Teo_TDD
│   │   └── Fst
│   │       ├── 2DSFS_Intergenic.Tripsicum.Teosinte.sfs
│   │       ├── Teosinte_Intergenic.arg
│   │       ├── Tripsicum_Intergenic.arg
│   │       ├── Tripsicum_Intergenic.mafs.gz
│   │       ├── Tripsicum_Intergenic.saf.gz
│   │       ├── Tripsicum_Intergenic.saf.idx
│   │       ├── Tripsicum_Intergenic.saf.pos.gz
│   │       ├── Tripsicum.Teosinte.fst.global
│   │       └── Tripsicum.Teosinte.fst.slidingwindow
│   ├── Teo_TDD_Common_Config
│   ├── Teo_TDD_FST_Config
│   ├── teo_tdd.indF
│   └── teo_tdd_samples.txt
├── chr_fst.info
├── chrom_configs
│   ├── 1
│   │   ├── Maize_TDD_Common_Config
│   │   ├── Maize_TDD_FST_config
│   │   ├── region.txt
│   │   ├── Teo_TDD_Common_Config
│   │   └── Teo_TDD_FST_Config
│   ├── 10
│   │   ├── Maize_TDD_Common_Config
│   │   ├── Maize_TDD_FST_config
│   │   ├── region_sorted.txt
│   │   ├── region.txt
│   │   ├── Teo_TDD_Common_Config
│   │   └── Teo_TDD_FST_Config
│   ├── 2
│   │   ├── Maize_TDD_Common_Config
│   │   ├── Maize_TDD_FST_config
│   │   ├── region_sorted.txt
│   │   ├── region.txt
│   │   ├── Teo_TDD_Common_Config
│   │   └── Teo_TDD_FST_Config
│   ├── 3
│   │   ├── Maize_TDD_Common_Config
│   │   ├── Maize_TDD_FST_config
│   │   ├── region_sorted.txt
│   │   ├── region.txt
│   │   ├── Teo_TDD_Common_Config
│   │   └── Teo_TDD_FST_Config
│   ├── 4
│   │   ├── Maize_TDD_Common_Config
│   │   ├── Maize_TDD_FST_config
│   │   ├── region_sorted.txt
│   │   ├── region.txt
│   │   ├── Teo_TDD_Common_Config
│   │   └── Teo_TDD_FST_Config
│   ├── 5
│   │   ├── Maize_TDD_Common_Config
│   │   ├── Maize_TDD_FST_config
│   │   ├── region_sorted.txt
│   │   ├── region.txt
│   │   ├── Teo_TDD_Common_Config
│   │   └── Teo_TDD_FST_Config
│   ├── 6
│   │   ├── Maize_TDD_Common_Config
│   │   ├── Maize_TDD_FST_config
│   │   ├── region_sorted.txt
│   │   ├── region.txt
│   │   ├── Teo_TDD_Common_Config
│   │   └── Teo_TDD_FST_Config
│   ├── 7
│   │   ├── Maize_TDD_Common_Config
│   │   ├── Maize_TDD_FST_config
│   │   ├── region_sorted.txt
│   │   ├── region.txt
│   │   ├── Teo_TDD_Common_Config
│   │   └── Teo_TDD_FST_Config
│   ├── 8
│   │   ├── Maize_TDD_Common_Config
│   │   ├── Maize_TDD_FST_config
│   │   ├── region_sorted.txt
│   │   ├── region.txt
│   │   ├── Teo_TDD_Common_Config
│   │   └── Teo_TDD_FST_Config
│   └── 9
│       ├── Maize_TDD_Common_Config
│       ├── Maize_TDD_FST_config
│       ├── region_sorted.txt
│       ├── region.txt
│       ├── Teo_TDD_Common_Config
│       └── Teo_TDD_FST_Config
├── configs
│   ├── Ancestral_Sequence_Config
│   ├── Common_Config
│   ├── FST_Config
│   ├── inbreeding.indF
│   ├── maize.indF
│   ├── maize_samples.txt
│   ├── maize_tdd.indF
│   ├── regions.1_sorted.txt
│   ├── regions.1.txt
│   ├── regions_sorted.txt
│   ├── regions.txt
│   ├── samples_maize_tdd.filelist
│   ├── samples_teo_tdd.filelist
│   ├── Site_Frequency_Spectrum_Config
│   ├── tdd.filelist
│   ├── tdd.indF
│   ├── teo.indF
│   ├── teo_sample.txt
│   ├── teo_tdd.indF
│   ├── teo_test.indF
│   ├── teo_test_sample.txt
│   ├── test_sample.txt
│   └── test_tdd.indF
├── data
│   ├── bambase.list
│   ├── combinedBams.filelist
│   ├── processed
│   │   ├── chrom_only.txt
│   │   ├── TDD.arg
│   │   └── TDD.fa.gz
│   ├── raw
│   │   ├── B73.bam
│   │   ├── B73.bam.bai
│   │   ├── B73.chr10.sort.bam
│   │   ├── B73.sort.bam
│   │   ├── B73.sort.bam.bai
│   │   ├── bam_sort_idx.info
│   │   ├── CML103.bam
│   │   ├── CML103.chr10.sort.bam
│   │   ├── CML103.sort.bam
│   │   ├── CML103.sort.bam.bai
│   │   ├── KI3.bam
│   │   ├── KI3.chr10.sort.bam
│   │   ├── KI3.sort.bam
│   │   ├── KI3.sort.bam.bai
│   │   ├── Mo17.bam
│   │   ├── Mo17.bam.bai
│   │   ├── Mo17.chr10.sort.bam
│   │   ├── Mo17.sort.bam
│   │   ├── Mo17.sort.bam.bai
│   │   ├── Oh43.bam
│   │   ├── Oh43.chr10.sort.bam
│   │   ├── Oh43.sort.bam
│   │   ├── Oh43.sort.bam.bai
│   │   ├── TDD.arg
│   │   ├── TDD.bam
│   │   ├── TDD.bam.bai
│   │   ├── TDD.chr10.sort.bam
│   │   ├── TDD_chrom_only.fa
│   │   ├── TDD_chrom_only.fa.fai
│   │   ├── TDD.fa
│   │   ├── TDD.fa.fai
│   │   ├── TDD_filtered.bam
│   │   ├── TDD.sort.bam
│   │   ├── TDD.sort.bam.bai
│   │   ├── TIL01.bam
│   │   ├── TIL01.chr10.sort.bam
│   │   ├── TIL01.sort.bam
│   │   ├── TIL01.sort.bam.bai
│   │   ├── TIL03.bam
│   │   ├── TIL03.chr10.sort.bam
│   │   ├── TIL03.sort.bam
│   │   ├── TIL03.sort.bam.bai
│   │   ├── TIL05.bam
│   │   ├── TIL05.chr10.sort.bam
│   │   ├── TIL05.sort.bam
│   │   ├── TIL05.sort.bam.bai
│   │   ├── TIL09.bam
│   │   ├── TIL09.chr10.sort.bam
│   │   ├── TIL09.sort.bam
│   │   ├── TIL09.sort.bam.bai
│   │   ├── TIL10.bam
│   │   ├── TIL10.chr10.sort.bam
│   │   ├── TIL10.sort.bam
│   │   ├── TIL10.sort.bam.bai
│   │   ├── TIL11.bam
│   │   ├── TIL11.chr10.sort.bam
│   │   ├── TIL11.sort.bam
│   │   ├── TIL11.sort.bam.bai
│   │   ├── TIL14.bam
│   │   ├── TIL14.chr10.sort.bam
│   │   ├── TIL14.sort.bam
│   │   ├── TIL14.sort.bam.bai
│   │   ├── TIL15.bam
│   │   ├── TIL15.chr10.sort.bam
│   │   ├── TIL15.sort.bam
│   │   ├── TIL15.sort.bam.bai
│   │   ├── TIL25.bam
│   │   ├── TIL25.chr10.sort.bam
│   │   ├── TIL25.sort.bam
│   │   ├── TIL25.sort.bam.bai
│   │   ├── W22.bam
│   │   ├── W22.chr10.sort.bam
│   │   ├── W22.sort.bam
│   │   └── W22.sort.bam.bai
│   ├── samples.filelist
│   ├── selectBams.filelist
│   └── tdd.filelist
├── inbreeding.indF
├── Maize_TDD_Common_Config
├── Maize_TDD_FST_config
├── README.md
├── results
│   ├── StepTest
│   │   └── Fst
│   │       ├── 2DSFS_Intergenic.Tripsicum.Teosinte.sfs
│   │       ├── Teosinte_Intergenic.arg
│   │       ├── Teosinte_Intergenic.mafs.gz
│   │       ├── Teosinte_Intergenic.saf.gz
│   │       ├── Teosinte_Intergenic.saf.idx
│   │       ├── Teosinte_Intergenic.saf.pos.gz
│   │       ├── Tripsicum_Intergenic.arg
│   │       ├── Tripsicum_Intergenic.mafs.gz
│   │       ├── Tripsicum_Intergenic.saf.gz
│   │       ├── Tripsicum_Intergenic.saf.idx
│   │       ├── Tripsicum_Intergenic.saf.pos.gz
│   │       ├── Tripsicum.Teosinte.fst.global
│   │       ├── Tripsicum.Teosinte.fst.gz
│   │       ├── Tripsicum.Teosinte.fst.idx
│   │       └── Tripsicum.Teosinte.fst.slidingwindow
│   ├── Teo_TDD
│   │   ├── angsd_fst.sh
│   │   ├── Fst
│   │   │   ├── Teosinte_Intergenic.arg
│   │   │   ├── Teosinte_Intergenic.mafs.gz
│   │   │   ├── Teosinte_Intergenic.saf.gz
│   │   │   ├── Teosinte_Intergenic.saf.idx
│   │   │   ├── Teosinte_Intergenic.saf.pos.gz
│   │   │   ├── Tripsicum_Intergenic.arg
│   │   │   ├── Tripsicum_Intergenic.mafs.gz
│   │   │   ├── Tripsicum_Intergenic.saf.gz
│   │   │   ├── Tripsicum_Intergenic.saf.idx
│   │   │   └── Tripsicum_Intergenic.saf.pos.gz
│   │   ├── Teo_TDD_Common_Config
│   │   └── Teo_TDD_FST_Config
│   └── TeoTest
│       ├── angsd_fst.sh
│       └── Fst
│           ├── 2DSFS_Intergenic.Tripsicum.Teosinte.sfs
│           ├── Teosinte_Intergenic.arg
│           ├── Teosinte_Intergenic.mafs.gz
│           ├── Teosinte_Intergenic.saf.gz
│           ├── Teosinte_Intergenic.saf.idx
│           ├── Teosinte_Intergenic.saf.pos.gz
│           ├── Tripsicum_Intergenic.arg
│           ├── Tripsicum_Intergenic.mafs.gz
│           ├── Tripsicum_Intergenic.saf.gz
│           ├── Tripsicum_Intergenic.saf.idx
│           ├── Tripsicum_Intergenic.saf.pos.gz
│           ├── Tripsicum.Teosinte.fst.global
│           ├── Tripsicum.Teosinte.fst.gz
│           ├── Tripsicum.Teosinte.fst.idx
│           └── Tripsicum.Teosinte.fst.slidingwindow
├── scripts
│   ├── angsd_ancestral.sh
│   ├── angsd_fst_byChr.sh
│   ├── angsd_fst.sh
│   ├── angsd_sfs.sh
│   ├── combineBams.sh
│   ├── iget_bams.sh
│   ├── Maize_Example_Common_Config
│   ├── sortIndex.sh
│   ├── sra_tdd.sh
│   └── tdd_iget.sh
├── Teo_TDD_Common_Config
├── Teo_TDD_FST_Config
├── test_Common_Config
└── test_FST_Config
```

