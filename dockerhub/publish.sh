#!/bin/sh

if [ "$#" -ne 1 ]; then
    echo "Use like this ./publish <tag-number>"
    exit 1
fi

docker push coderitter/pulp-riscv-gnu-toolchain:$1