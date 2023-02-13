FROM ubuntu:20.04

ENV DEBIAN_FRONTEND noninteractive
ENV PATH "/opt/riscv/bin:${PATH}"

WORKDIR /hostdir

RUN set -x \
    && apt-get update \
    && apt-get -y install \
        autoconf \
        automake \
        autotools-dev \
        curl \
        libmpc-dev \
        libmpfr-dev \
        libgmp-dev \
        gawk \
        build-essential \
        bison \
        flex \
        texinfo \
        gperf \
        libtool \
        patchutils \
        bc \
        zlib1g-dev \
        git \
    && git clone --recursive --single-branch --depth 1 https://github.com/pulp-platform/pulp-riscv-gnu-toolchain \
    && cd pulp-riscv-gnu-toolchain \
    && ./configure --prefix=/opt/riscv --with-arch=rv32imfcxpulpv2 --with-abi=ilp32 --enable-multilib make \
    && make \
    && apt-get remove --purge -y \
        autoconf \
        automake \
        autotools-dev \
        curl \
        # libmpc-dev \
        # libmpfr-dev \
        # libgmp-dev \
        gawk \
        build-essential \
        bison \
        flex \
        texinfo \
        gperf \
        libtool \
        patchutils \
        bc \
        zlib1g-dev \
        git \
    && apt-get clean autoclean \
    && rm -rf /hostdir/pulp-riscv-gnu-toolchain

ENTRYPOINT [ "riscv32-unknown-elf-gcc" ]