FROM openstackloci/glance:debian

ARG OVERRIDE=override

ADD $OVERRIDE /

RUN set -x \
    && apt-key add /ceph.asc \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
        ceph-common \
        python-rbd \
    && rm -rf /var/lib/apt/lists/*
