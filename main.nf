#!/usr/bin/env nextflow

workflow {
    stress(10000000000)
}

process stress {
    label "process_single"

    container "${workflow.containerEngine == 'apptainer' && !task.ext.singularity_pull_docker_container
        ? 'docker://quentinblampey/sopa:2.0.3'
        : 'docker.io/quentinblampey/sopa:2.0.3'}"

    input:
    val bytes

    script:
    """
    python -c "import numpy as np; np.zeros(${bytes}, dtype=np.uint8)"
    """
}
