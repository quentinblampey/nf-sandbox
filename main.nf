#!/usr/bin/env nextflow

workflow {
    stress(10000000000)
}

process stress {
    label "process_single"

    container "${workflow.containerEngine == 'apptainer' && !task.ext.singularity_pull_docker_container
        ? 'docker://nmeyerhans/stress:latest'
        : 'docker.io/nmeyerhans/stress:latest'}"

    input:
    val bytes

    script:
    """
    stress -m 1 --vm-bytes ${bytes} -t 20
    """
}
