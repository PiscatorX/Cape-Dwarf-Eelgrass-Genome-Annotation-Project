#!/bin/bash

#PBS -N Blanks_microbiome
#PBS -l select=1:ncpus=24
#PBS -l walltime=12:00:00

set -eux

#command line args
# query=$1
# reference=$2

# prefix=nucmer


# nucmer \
#      -p ${prefix} \
#     ${reference} \
#     ${query}    


show-coords \
    -r \
    -c \
    -l \
    nucmer.delta | awk "NR >3 {print }" |  tr -d '[]' | grep  -v  "=" >  nucmer.coords 
 



#show-aligns [options] <deltafile> <IdR> <IdQ>
#show-aligns nucmer.delta PDUP01000023.1   PDUP01000026.1    
