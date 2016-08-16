## docker-flume

  Docker image containing [Apache Flume](https://flume.apache.org/)

## Build Instructions

    docker build -t flume .

## Available environment variables

 * `FLUME_AGENT_NAME` - name of the Flume agent to run. **Required**
 * `FLUME_CONF_FILE` - location of flume configuration file. **Required**
 * `FLUME_CONF_DIR` - directory for flume environment/configuration files. Defaults to `/opt/flume/conf`
 * `FLUME_LOG_LEVEL` - the log level used by Flume.

## Example usage

    FROM probablyfine/flume
    ADD flume.conf /var/tmp/flume.conf

And to run

    docker run \
      -e FLUME_AGENT_NAME=someagent \
      -e FLUME_CONF_FILE=/var/tmp/flume.conf \
      my-flume-image
