#!/bin/bash

#PBS -N Blanks_microbiome
#PBS -l select=1:ncpus=48
#PBS -l walltime=12:00:00

set -e

module load app/NCBI/2.15.0+
module load app/BUSCO/5.7.1

threads=48

query="/new-home/andhlovu/DB_REF/Zostera_GenomeFiles/Zcap_polished_subsammple.fasta"
output_dir="/new-home/andhlovu/Cape-Dwarf-Eelgrass-Genome-Annotation-Project/BlobToolKit"
ASSEMBLY_NAME=Zcap_draft2


# blastn -db nt \
#        -query ${query}  \
#        -outfmt "6 qseqid staxids bitscore std" \
#        -max_target_seqs 10 \
#        -max_hsps 1 \
#        -evalue 1e-25 \
#        -num_threads  ${threads} \
#        -out "${output_dir}/${ASSEMBLY_NAME}.ncbi.blastn.out"


# diamond blastx \
#         --query ${query} \
#         --db /new-home/andhlovu/DB_REF/SwissProt/reference_proteomes.dmnd \
#         --outfmt 6 qseqid staxids bitscore qseqid sseqid pident length mismatch gapopen qstart qend sstart send evalue bitscore \
#         --sensitive \
#         --max-target-seqs 1 \
#         --evalue 1e-25 \
#         --threads ${threads} > "${output_dir}/${ASSEMBLY_NAME}.diamond.blastx.out"


busco \
    -f \
    -m genome  \
    -i ${query} \
    --cpu ${threads} \
    --out_path "${output_dir}" \
    -l /new-home/andhlovu/DB_REF/BUSCO/liliopsida_odb10

generate_plot.py --working_directory "${output_dir}/BUSCO_$(basename "${query}")"




