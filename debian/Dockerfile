FROM debian:jessie-slim

ENV PROJECT=glance
ARG DOCKER_REPO=yaodu/openstack-requirements
ARG DOCKER_TAG=latest
ARG WHEELS
ARG GIT_REPO=https://git.openstack.org/openstack/${PROJECT}
ARG GIT_REF
ARG GIT_REF_REPO=https://git.openstack.org/openstack/${PROJECT}
ARG SCRIPTS_REF=master
ARG SCRIPTS_REPO=https://github.com/openstack/loci/
ARG OVERRIDE=empty

ADD $OVERRIDE /

RUN set -x \
    && apt-get update \
    && apt-get install -y --no-install-recommends python ca-certificates curl git \
    && git clone --branch $SCRIPTS_REF --depth 1 $SCRIPTS_REPO /tmp/common \
    && /tmp/common/scripts/download.sh $DOCKER_REPO $DOCKER_TAG $WHEELS \
    && /tmp/common/scripts/install.sh $PROJECT $GIT_REPO $GIT_REF_REPO $GIT_REF \
    && /tmp/common/scripts/cleanup.sh
