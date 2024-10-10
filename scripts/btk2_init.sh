#!/bin/bash
#PBS -N Btk
#PBS -l select=1:ncpus=48
#PBS -l walltime=12:00:00
#set -xu



threads=48
query="/home/andhlovu/DB_REF/Zostera_GenomeFiles/Zcap_reduced_v4.fa"
#query="/home/andhlovu/DB_REF/Zostera_GenomeFiles/extract_Zcap_reduced_v3.fasta"
BlobDir="/home/andhlovu/Cape-Dwarf-Eelgrass-Genome-Annotation-Project/BlobToolKit/Zostera_capensis"
bam_files=$(ls /new-home/andhlovu/DB_REF/BAM/Zcapensis/*.bam)
output_dir="/home/andhlovu/Cape-Dwarf-Eelgrass-Genome-Annotation-Project/BlobToolKit/"
ASSEMBLY_NAME=Zcap_draft4
busco_path="${output_dir}/BUSCO_$(basename "${query}")"


#https://blobtoolkit.genomehubs.org/blobtools2/blobtools2-tutorials/adding-data-to-a-dataset/adding-hits/
blobtools create \
   --fasta ${query} \
   --meta /home/andhlovu/DB_REF/Metadata/Zostera_capensis.yaml \
   --taxid 214524 \
   --taxdump /new-home/andhlovu/DB_REF/NCBI/taxdump \
   "${BlobDir}"




blobtools add \
    --hits  "${output_dir}/${ASSEMBLY_NAME}.ncbi.blastn.out" \
    --hits   "${output_dir}/${ASSEMBLY_NAME}.diamond.blastx.out" \
    --taxrule bestsumorder \
    --taxdump /new-home/andhlovu/DB_REF/NCBI/taxdump \
    "${BlobDir}"    



busco_fulltable=$(find ${busco_path} -iname "full_table.tsv" -type f)
blobtools add \
    --busco ${busco_fulltable} \
    "${BlobDir}"




bam_out=${output_dir}/bam
mkdir -p ${bam_out}
for bam in ${bam_files}
do
 fname=$(basename ${bam})
 samtools sort ${bam} -o ${bam_out}/sorted_${fname}
 samtools index -c ${bam_out}/sorted_${fname}

 blobtools add \
     --threads ${threads} \
     --cov ${bam_out}/sorted_${fname} \
     "${BlobDir}"
done



