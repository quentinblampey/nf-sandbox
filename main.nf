#!/usr/bin/env nextflow

workflow {
    stress(2000000000)
}

process stress {
    label "process_single"

    container "${workflow.containerEngine == 'apptainer' && !task.ext.singularity_pull_docker_container
        ? 'docker://progrium/stress:latest'
        : 'docker.io/progrium/stress:latest'}"

    input:
    val bytes

    script:
    """
    stress -m 1 --vm-bytes ${bytes} -t 5
    """
}
