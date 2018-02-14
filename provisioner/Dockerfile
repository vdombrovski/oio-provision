FROM ansible/centos7-ansible

MAINTAINER Vladimir DOMBROVSKI (vladimir@openio.io)

RUN yum install -y python-jinja2 git pyyaml

COPY data/* /root/

ARG ts=none
RUN echo "Timestamp: $ts"

RUN git clone https://github.com/vdombrovski/ansible-role-openio-sds /etc/ansible/roles/ansible-role-openio-sds && \
    cd /etc/ansible/roles/ansible-role-openio-sds && git checkout docker

RUN echo "   StrictHostKeyChecking no" >> /etc/ssh/ssh_config
RUN chmod 600 /root/id_rsa
