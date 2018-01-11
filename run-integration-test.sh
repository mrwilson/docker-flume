#!/bin/bash

OUTPUT_DIR=output
INPUT=ding

create-output-dir() {
    echo "[docker-flume] Preparing output directory"
    mkdir -p ${OUTPUT_DIR}
}

bring-up-system() {
    echo "[docker-flume] Starting system"
    docker-compose up -d
    sleep 5
}

tear-down-system() {
    echo "[docker-flume] Stopping system and cleaning up"
    docker-compose down
    rm -rf ${OUTPUT_DIR}
}

submit-test-data() {
    echo "[docker-flume] Submitting test data [${INPUT}]"
    echo ${INPUT} | nc localhost 44444
    sleep 10
}

output-data() {
    cat ${OUTPUT_DIR}/*
}

create-output-dir
bring-up-system
submit-test-data
OUTPUT=$(output-data)
tear-down-system

if [[ "${OUTPUT}" == "${INPUT}" ]]; then
    echo "[docker-flume] Successfully transferred [${INPUT}] through multi-agent flume system"
    exit 0
else
    echo "[docker-flume] Did not find expected output, got [${OUTPUT}] instead"
    exit 1
fi
