# OpenStack yaodu/glance
[![Docker Automated buil](https://img.shields.io/docker/automated/yaodu/glance.svg)](https://hub.docker.com/r/yaodu/glance/)

Yaodu/glance is a set of Dockerfiles that builds lightweight deployment agnostic images for OpenStack Glance.

Images are built in the Docker Hub automatically on each push to the master branch to provide a continuously updated set of images based on a number of distributions. Additionally, this repo may be cloned and used to build images for OpenStack Glance either for development purposes or as part of a CI/CD workflow.


### Image Layer Info
[![](https://images.microbadger.com/badges/version/yaodu/glance:latest.svg)](https://microbadger.com/images/yaodu/glance:latest "yaodu/glance:latest") [![](https://images.microbadger.com/badges/image/yaodu/glance:latest.svg)](https://microbadger.com/images/yaodu/glance:latest "yaodu/glance:latest")

[![](https://images.microbadger.com/badges/version/yaodu/glance:ubuntu.svg)](https://microbadger.com/images/yaodu/glance:ubuntu "yaodu/glance:ubuntu") [![](https://images.microbadger.com/badges/image/yaodu/glance:ubuntu.svg)](https://microbadger.com/images/yaodu/glance:ubuntu "yaodu/glance:ubuntu")

[![](https://images.microbadger.com/badges/version/yaodu/glance:centos.svg)](https://microbadger.com/images/yaodu/glance:centos "yaodu/glance:centos") [![](https://images.microbadger.com/badges/image/yaodu/glance:centos.svg)](https://microbadger.com/images/yaodu/glance:centos "yaodu/glance:centos")


## Building locally
It's really easy to build images locally for the distro of your choice. To build an image you only need to run:
``` bash
$ docker build https://github.com/yaodu/docker-glance.git \
  --file dockerfiles/Dockerfile-debian \
  --tag yaodu/glance:latest
```
You can, of course, substitute `debian` with your distro of choice.

For more advanced building you can use docker build arguments to define:
  * The git repo containing the OpenStack project the container should contain, `GIT_REPO`
  * The git ref the container should use when building, `GIT_REF`
  * The git repo the container should use when building from a git ref, `GIT_REF_REPO`
  * The docker image name to use for the base requirements python wheels, `DOCKER_REPO`
  * The docker image tag to use for the base requirements python wheels, `DOCKER_TAG`
  * If present, rather than using a docker image containing OpenStack requirements a tarball will be used from the defined URL, `WHEELS`

This makes it really easy to integrate Yaodu images into your development or CI/CD workflow, for example, if you wanted to build an image from [this PS](https://review.openstack.org/#/c/368405/12) you could run:
``` bash
$ docker build https://github.com/yaodu/docker-glance.git \
  --file dockerfiles/Dockerfile-ubuntu \
  --tag mydockernamespace/glance-testing:368405-12 \
  --build-arg GIT_REPO=http://git.openstack.org/openstack/glance.git \
  --build-arg GIT_REF_REPO=http://git.openstack.org/openstack/glance.git \
  --build-arg GIT_REF=refs/changes/05/368405/12
```


## Customizing
The images should contain all the required assets for running the service. But if you wish or need to customize the `yaodu/glance` image that's great! We hope to have built the images to make this as easy and flexible as possible. To do this we recommend that you perform any required customisation in a child image using a pattern similar to:

``` Dockerfile
FROM yaodu/glance:latest
MAINTAINER you@example.com

RUN set -x \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
    your-awesome-binary-package \
    && rm -rf /var/lib/apt/lists/*
```
