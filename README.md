# A Docker file for the PULP RISC-V GNU Compiler Toolchain

This repo contains Dockerfiles which will compile the most recent PULP RISC-V GNU Compiler Toolchain in different configurations.

## Configurations

### Soft Floats

Use this if the target prozessor has no hardware support for floats.
Since every RISC-V prozessor supports soft floats this is the default configuration.

### Hard Floats

Use this if the target prozessor has hardware support for floats.

## Build

The folders `soft-float` and `hard-float` contain a script `build.sh` to build the image.

## Docker Hub

There are multiple prebuild ready-to-use Docker images available on [Docker Hub](https://hub.docker.com/r/coderitter/pulp-riscv-gnu-toolchain). Use it like this.

In your project, create a shell script for the RISC V compiler executable. You can name the file `riscv32-unknown-elf-gcc` which is the exact name of the RISC V compiler executable inside the Docker container. Put the following content inside of it.

```
#!/bin/sh
docker run --rm --entrypoint riscv32-unknown-elf-gcc --volume $PWD:/hostdir coderitter/pulp-riscv-gnu-toolchain "$@"
```

This call to `docker run` will create a temporary Docker container with the current directory mounted into Docker container. It then executes the RISC V compiler executable and forwards any parameters which were made when the script was executed.

The last step is to set the permission of the file so that is executable.

```
chmod a+x riscv32-unknown-elf-gcc
```

Now you can use the script as if the compiler itself was installed on your host system.

```
./riscv32-unknown-elf-gcc -std=c99 -march=rv32imfdcxpulpv2 src -o build/firmware
```