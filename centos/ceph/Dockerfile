FROM openstackloci/glance:centos

ARG OVERRIDE=override

ADD $OVERRIDE /

RUN set -x \
    && yum install -y \
        ceph-common \
        python-rbd \
    && yum clean all
