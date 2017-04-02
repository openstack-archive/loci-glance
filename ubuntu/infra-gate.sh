#!/bin/bash

set -eux

source /etc/nodepool/provider

NODEPOOL_MIRROR_HOST=${NODEPOOL_MIRROR_HOST:-mirror.$NODEPOOL_REGION.$NODEPOOL_CLOUD.openstack.org}
NODEPOOL_MIRROR_HOST=${NODEPOOL_MIRROR_HOST,,}

TMPDIR=$(mktemp -d)
mkdir -p ${TMPDIR}/etc/apt/sources.list.d
echo 'APT::Get::AllowUnauthenticated "true";' > ${TMPDIR}/etc/apt/apt.conf
cat << EOF > ${TMPDIR}/etc/apt/sources.list.d/ceph.list
deb http://download.ceph.com/debian-jewel xenial main
EOF

tar cvf override.tar -C ${TMPDIR} .
