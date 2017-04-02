#!/bin/bash

set -eux

source /etc/nodepool/provider

NODEPOOL_MIRROR_HOST=${NODEPOOL_MIRROR_HOST:-mirror.$NODEPOOL_REGION.$NODEPOOL_CLOUD.openstack.org}
NODEPOOL_MIRROR_HOST=${NODEPOOL_MIRROR_HOST,,}

TMPDIR=$(mktemp -d)
mkdir -p ${TMPDIR}/etc/apt/sources.list.d
echo 'APT::Get::AllowUnauthenticated "true";' > ${TMPDIR}/etc/apt/apt.conf
cat << EOF > ${TMPDIR}/etc/apt/sources.list
deb http://${NODEPOOL_MIRROR_HOST}/ubuntu xenial main restricted universe
deb http://${NODEPOOL_MIRROR_HOST}/ubuntu xenial-updates main restricted universe
deb http://${NODEPOOL_MIRROR_HOST}/ubuntu xenial-security main restricted universe
deb http://${NODEPOOL_MIRROR_HOST}/ceph-deb-jewel xenial main
EOF

tar cvfz override.tar.gz -C ${TMPDIR} .
