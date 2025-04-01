#!/usr/bin/env nextflow

workflow {
    test_cat(params.file)
}

process test_cat {
    publishDir params.outdir, mode: 'copy'

    label "process_low"

    container "nf-core/modules/spaceranger:d71611e316a8614b"

    input:
    val file

    output:
    path "res.txt"

    script:
    """
    cat ${file} > res.txt
    """
}
