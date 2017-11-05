[![Docker Build Status](https://img.shields.io/docker/build/probablyfine/flume.svg)]() [![Docker Stars](https://img.shields.io/docker/stars/probablyfine/flume.svg)]()

## docker-flume

  Docker image containing [Apache Flume](https://flume.apache.org/)

## Build Instructions

    docker build -t flume .

## Available environment variables

 * `FLUME_AGENT_NAME` - name of flume agent to run. **Required**
 * `FLUME_CONF_FILE` - location of flume configuration file. **Required**
 * `FLUME_CONF_DIR` - directory for flume environment/configuration files. Defaults to `/opt/flume/conf`

## Example usage

    FROM probablyfine/flume
    ADD flume.conf /var/tmp/flume.conf

And to run

    docker run \
      -e FLUME_AGENT_NAME=someagent \
      -e FLUME_CONF_FILE=/var/tmp/flume.conf \
      my-flume-image
