#!/usr/bin/env nextflow

workflow {
    // def meta = Channel.of([id: 1, data_dir: "1_spaceranger"], [id: 2, data_dir: "2_spaceranger"], [id: 3, data_dir: "3_spaceranger"])

    // (meta, files) = SPACERANGER_COUNT(meta)

    // test(meta, files)

    echo(params.file, [])
}

process echo {
    publishDir params.outdir, mode: 'copy'

    label "process_low"

    container "nf-core/modules/spaceranger:d71611e316a8614b"

    input:
    val file
    val paths

    output:
    path "expe"

    script:
    """
    cat ${file} > expe
    """
}

process SPACERANGER_COUNT {
    input:
    val meta

    output:
    val meta
    path "outs/a*"

    script:
    """
    mkdir outs
    echo "hello world1 ${meta.id}" > outs/a1
    echo "hello world2 ${meta.id}" > outs/a2
    """
}

process test {
    publishDir params.outdir, mode: 'copy'

    input:
    val meta
    path files

    output:
    path "b*"

    script:
    """
    cat a1 > b_${meta.id}
    """
}
