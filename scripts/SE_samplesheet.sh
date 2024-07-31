#!/bin/bash

set -ue



if [ -z $1 ]

then
    echo "Usage:"
    echo "SE_samplesheet.sh [reads directory ] [samplesheet output path ]"
    echo "For single end read data only"
    exit 1
fi

if [ -z $2 ]

then
 echo "Usage:"
    echo "SE_samplesheet.sh [reads directory ] [samplesheet output path ]"
    echo "For single end read data only"
    exit 
fi

reads_dir=$1
samplesheet="${2}"


echo "sample,fastq_1,fastq_2,strandedness" > "${samplesheet}"
for fastq  in ${reads_dir}/*.fastq.gz
do
base=$(basename  ${fastq})
base="${base/.fastq.gz/}"
#sample,fastq_1,fastq_2,strandedness
echo ${base},${fastq},,auto >> "${samplesheet}"
done 

