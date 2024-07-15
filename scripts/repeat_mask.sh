#!/bin/bash
#PBS -N Bt2k_init
#PBS -l select=1:ncpus=48
#PBS -l walltime=48:00:00
set -eu


threads=48
query="/home/andhlovu/DB_REF/Zostera_GenomeFiles/Zcap_polished_reduced.fa"
DB=some_db_name_that_fits_to_species

mkdir -p ${DB_REF}/RepeatModeler/

RepeatModeler_sif="/new-home/andhlovu/bin/singularity-images/depot.galaxyproject.org-singularity-repeatmodeler-2.0.2a--pl5321h9ee0642_1.img"

BuildDatabase -name ${DB} ${GENOME}
RepeatModeler -database ${DB} -pa ${T} -LTRStruct
RepeatMasker -pa 72 -lib ${DB}-families.fa -xsmall ${GENOME}
