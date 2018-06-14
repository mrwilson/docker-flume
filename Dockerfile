FROM debian:jessie
MAINTAINER Alex Wilson a.wilson@alumni.warwick.ac.uk

ENV JAVA_HOME /opt/java
ENV PATH /opt/flume/bin:/opt/java/bin:$PATH
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -qq \ 
    && apt-get install -q -y --no-install-recommends wget \
    && mkdir /opt/java \ 
    && wget --no-check-certificate --header "Cookie: oraclelicense=accept-securebackup-cookie" -qO- \
          http://download.oracle.com/otn-pub/java/jdk/8u171-b11/512cd62ec5174c3487ac17c61aaa89e8/jre-8u171-linux-x64.tar.gz \
          | tar zxvf - -C /opt/java --strip 1 \
    && mkdir /opt/flume \ 
    && wget -qO- http://archive.apache.org/dist/flume/1.8.0/apache-flume-1.8.0-bin.tar.gz \
          | tar zxvf - -C /opt/flume --strip 1

ADD start-flume.sh /opt/flume/bin/start-flume

ENTRYPOINT [ "start-flume" ]
