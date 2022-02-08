# A Docker file for the PULP RISC-V GNU Compiler Toolchain

This packages contains a Dockerfile which will compile the most recent PULP RISC-V GNU Compiler Toolchain.

## Docker Hub

There is prebuild ready-to-use Docker images available on [Docker Hub](https://hub.docker.com/r/coderitter/pulp-riscv-gnu-toolchain). Use it like this.

In your project, create a shell script for the RISC V compiler executable. You can name the file `riscv32-unknown-elf-gcc` which is the exact name of the RISC V compiler executable inside the Docker container. Put the following content inside of it.

```
#!/bin/sh
docker run --rm --volume $PWD:/hostdir coderitter/pulp-riscv-gnu-toolchain --entrypoint riscv32-unknown-elf-gcc "$@"
```

This call to `docker run` will create a temporary Docker container with the current directory mounted into Docker container. It then executes the RISC V compiler executable and forwards any parameters which were made when the script was executed.

The last step is to set the permission of the file to be executable `chmod a+x riscv32-unknown-elf-gcc`.

Now you can use the script as if the compiler itself was installed in your host system.

```
./riscv32-unknown-elf-gcc -std=c99 -march=rv32imfdcxpulpv2 src -o build/firmware
```

## Coderitter

The directory `coderitter` contains the Docker Hub readme and Coderitter specific scripts to build the image.