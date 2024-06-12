#!/bin/bash

#PBS -N Blanks_microbiome
#PBS -l select=1:ncpus=24
#PBS -l walltime=12:00:00

set -eux

#command line args
query=$1
reference=$2

prefix=nucmer


nucmer \
     -p ${prefix} \
    ${reference} \
    ${query}    


show-coords \
    -r \
    -c \
    -l \
    nucmer.delta > nucmer.coords
