# Cape-Dwarf Eelgrass Genome Annotation
Annotation of Zostera capensis genome
Taxonomy ID: 214524

### Generating a [BlobToolKit](https://blobtoolkit.genomehubs.org/) Snailplot

1. A Blobtoolkit2 conda environment was created on the cluster as per software instructions [https://blobtoolkit.genomehubs.org/install/#databases]
1. To generate Blast (nt database), Diamond (SwissProt) and BUSCO (liliopsida_odb10), all database output the [get_blobtoolkt_data.sh](scripts/get_blobtoolkt_data.sh) was used
1. To populate the BlobDir the [btk2_init.sh](scripts/btk2_init.sh) was used following provided [instructions](https://blobtoolkit.genomehubs.org/blobtools2/blobtools2-tutorials/creating-a-dataset/)

### Distant protein homology using a partitioned [OrthoDBv11](https://bioinf.uni-greifswald.de/bioinf/partitioned_odb11/)
1. The [Viridiplantae](https://bioinf.uni-greifswald.de/bioinf/partitioned_odb11/Viridiplantae.fa.gz) partition of the OrthoDB v11 was used.



