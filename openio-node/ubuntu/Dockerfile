FROM ubuntu:xenial

MAINTAINER Vladimir DOMBROVSKI (vladimir@openio.io)

RUN apt -y update && \
    apt install -y curl rsyslog vim ssh python && \
    echo "deb http://mirror.openio.io/pub/repo/openio/sds/17.04/ubuntu/ xenial/" > /etc/apt/sources.list.d/openio-sds.list && \
    curl http://mirror.openio.io/pub/repo/openio/APT-GPG-KEY-OPENIO-0 | apt-key add && \
    apt -y update && \
    apt install -y puppet puppet-module-openio-openiosds openio-sds openio-sds-rsyslog openio-sds-logrotate zookeeper redis-server beanstalkd && \
    mkdir -p /root/.ssh
RUN apt -y install netcat
COPY id_rsa.pub /root/.ssh/authorized_keys

ARG ts=none
RUN echo "Timestamp: $ts"
