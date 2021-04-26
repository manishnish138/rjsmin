#!/bin/bash
set -ex

docker run --rm -v "$(pwd)":/io quay.io/pypa/manylinux2010_x86_64 /io/wheel/build.sh rjsmin 0.9
