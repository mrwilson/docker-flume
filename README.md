[![Build Status](https://travis-ci.org/mrwilson/docker-flume.svg?branch=master)](https://travis-ci.org/mrwilson/docker-flume)
[![Docker Build Status](https://img.shields.io/docker/build/probablyfine/flume.svg)](https://hub.docker.com/r/probablyfine/flume/builds/)
[![Docker Stars](https://img.shields.io/docker/stars/probablyfine/flume.svg)](https://hub.docker.com/r/probablyfine/flume/)

# docker-flume

  Self-contained Docker image containing Java and [Apache Flume](https://flume.apache.org/)

## Environment variables

 * `FLUME_AGENT_NAME` - name of the Flume agent to run. **Required**
 * `FLUME_LOG_LEVEL` - the log level used by Flume.

## Usage

    $ docker pull probablyfine/flume
    $ docker run \
      --env FLUME_AGENT_NAME=docker \
      --env FLUME_LOG_LEVEL=INFO \
      --volume /tmp/config.conf:/opt/flume-config/flume.conf \
      --detach \
      probablyfine/flume:latest

Note: the `FLUME_AGENT_NAME` environment variable and presence of `/opt/flume-config/flume.conf` on the image are **required**.
  
## Building your own

Set up configuration directory and required environment variables in a Dockerfile

    FROM probablyfine/flume
    ENV FLUME_AGENT_NAME docker
    ADD flume.conf /opt/flume-config/flume.conf

Build and run image

    $ docker build -t my-flume-image .
    $ docker run --detch my-flume-image
