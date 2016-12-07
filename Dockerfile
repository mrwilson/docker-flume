FROM debian:jessie
MAINTAINER Alex Wilson a.wilson@alumni.warwick.ac.uk

ENV JAVA_HOME /opt/java
ENV PATH /opt/flume/bin:/opt/java/bin:$PATH
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -qq \ 
    && apt-get install -q -y --no-install-recommends wget \
    && mkdir /opt/java \ 
    && wget --no-check-certificate --header "Cookie: oraclelicense=accept-securebackup-cookie" -qO- \
          http://download.oracle.com/otn-pub/java/jdk/8u101-b13/jdk-8u101-linux-x64.tar.gz \
          | tar zxvf - -C /opt/java --strip 1 \
    && mkdir /opt/flume \ 
    && wget -qO- http://archive.apache.org/dist/flume/1.7.0/apache-flume-1.7.0-bin.tar.gz \
          | tar zxvf - -C /opt/flume --strip 1

ENTRYPOINT [ "start-flume" ]
