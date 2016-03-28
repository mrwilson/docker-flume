FROM debian:jessie
MAINTAINER Alex Wilson a.wilson@alumni.warwick.ac.uk

RUN apt-get update && apt-get install -q -y --no-install-recommends wget netcat

RUN mkdir /opt/java
RUN wget --no-check-certificate --header "Cookie: oraclelicense=accept-securebackup-cookie" -qO- \
  https://download.oracle.com/otn-pub/java/jdk/8u20-b26/jre-8u20-linux-x64.tar.gz \
  | tar zxvf - -C /opt/java --strip 1

RUN mkdir /opt/flume
RUN wget -qO- http://archive.apache.org/dist/flume/1.6.0/apache-flume-1.6.0-bin.tar.gz \
  | tar zxvf - -C /opt/flume --strip 1

ENV FLUME_AGENT_NAME a1
ENV FLUME_CONF_DIR /opt/flume/conf
ENV FLUME_CONF_FILE $FLUME_CONF_DIR/example-a1.conf

ADD example-a1.conf $FLUME_CONF_DIR/example-a1.conf
ADD start-flume.sh /opt/flume/bin/start-flume

ENV JAVA_HOME /opt/java
ENV PATH /opt/flume/bin:/opt/java/bin:$PATH

CMD [ "start-flume" ]
