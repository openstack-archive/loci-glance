#!/bin/bash
set -x
set -e
set -u

for repo in debian; do
	sed -e "s/%%DISTRO%%/${repo}/" downloader.sh > ${repo}/downloader.sh
    chmod +x ${repo}/downloader.sh
done
