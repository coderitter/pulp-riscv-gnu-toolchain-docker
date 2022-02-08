#!/bin/sh

# Use like this ./build <tag-number>
docker build --no-cache -t coderitter/pulp-riscv-gnu-toolchain:$1 ..