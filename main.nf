#!/usr/bin/env nextflow

workflow {
    echo(params.file)
}

process echo {
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
