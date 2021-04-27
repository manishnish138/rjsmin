#!/bin/bash
set -ex

pkg="${1}"
versions="${1}"
docker run --rm -v "$(pwd)":/io quay.io/pypa/manylinux2010_x86_64 /io/wheel/build.sh ${pkg} ${versions}
docker run --rm --privileged multiarch/qemu-user-static --reset -p yes
docker run --rm -v "$(pwd)":/io quay.io/pypa/manylinux2014_aarch64 /io/wheel/build.sh ${pkg} ${versions}
