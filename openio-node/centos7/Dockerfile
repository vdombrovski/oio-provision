FROM centos:7

MAINTAINER Vladimir DOMBROVSKI (vladimir@openio.io)

RUN yum -y install http://mirror.openio.io/pub/repo/openio/sds/17.04/el/openio-sds-release-17.04-1.el.noarch.rpm && \
    yum -y update && \
    yum install -y curl rsyslog vim ssh python && \
    yum install -y puppet puppet-openio-sds openio-sds openio-sds-rsyslog openio-sds-logrotate zookeeper redis-server beanstalkd && \
    mkdir -p /root/.ssh
RUN yum -y install nmap-ncat openssh-server-sysvinit
COPY id_rsa.pub /root/.ssh/authorized_keys

ARG ts=none
RUN echo "Timestamp: $ts"
