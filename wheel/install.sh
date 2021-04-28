#!/bin/bash
set -ex

pkg="${1}"
shift

versions="${@}"
hh=${version}
for version in ${versions};do
    docker run --rm -v "$(pwd)":/io quay.io/pypa/manylinux2014_x86_64 /io/wheel/build.sh ${pkg} ${version}
    docker run --rm --privileged multiarch/qemu-user-static --reset -p yes

    docker run --rm -v "$(pwd)":/io quay.io/pypa/manylinux2014_i686 /io/wheel/build.sh ${pkg} ${version}
    docker run --rm -v "$(pwd)":/io quay.io/pypa/manylinux2014_aarch64 /io/wheel/build.sh ${pkg} ${version}
done
