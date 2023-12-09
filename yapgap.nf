#!/usr/bin/env nextflow

nextflow.enable.dsl = 2

include { PLANT_GENOMEANNOTATOR } from './workflows/plant_genomeannotator'


workflow YAPGA {
    
    PLANT_GENOMEANNOTATOR()
	
}



workflow {
    YAPGA()
}


