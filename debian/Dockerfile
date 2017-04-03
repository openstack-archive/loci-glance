FROM debian:jessie-slim

ENV PROJECT=glance
ARG DOCKER_REPO=yaodu/openstack-requirements
ARG DOCKER_TAG=latest
ARG WHEELS
ARG GIT_REPO=https://git.openstack.org/openstack/${PROJECT}
ARG GIT_REF
ARG GIT_REF_REPO=https://git.openstack.org/openstack/${PROJECT}
ARG SCRIPTS=https://github.com/yaodu/common/archive/0.1.2.tar.gz

RUN set -x \
    && echo 'deb http://download.ceph.com/debian-jewel/ jessie main' > /etc/apt/sources.list.d/ceph.list \
    && apt-key adv --fetch-keys 'http://download.ceph.com/keys/release.asc' \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
        ca-certificates \
        ceph-common \
        curl \
        python \
        python-rbd \
    && curl -sSL $SCRIPTS | tar xz -C /tmp/ --strip-components=2 \
    && /tmp/download.sh $DOCKER_REPO $DOCKER_TAG $WHEELS \
    && /tmp/install.sh $PROJECT $GIT_REPO $GIT_REF_REPO $GIT_REF \
    && /tmp/cleanup.sh
