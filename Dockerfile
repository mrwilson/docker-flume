FROM openjdk:8-jre-alpine
MAINTAINER Alex Wilson a.wilson@alumni.warwick.ac.uk

ENV PATH /opt/flume/bin:$PATH

RUN apk update \
    && apk add --no-cache wget bash \
    && mkdir -p /opt/flume \
    && wget -qO- http://archive.apache.org/dist/flume/1.7.0/apache-flume-1.7.0-bin.tar.gz \
          | tar zxvf - -C /opt/flume --strip 1

ADD start-flume.sh /opt/flume/bin/start-flume

ENTRYPOINT [ "start-flume" ]
