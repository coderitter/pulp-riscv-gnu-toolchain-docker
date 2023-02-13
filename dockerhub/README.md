# PULP RISC-V GNU Compiler Toolchain

This Docker image contains the compiled PULP RISC-V GNU compiler toolchain.

## How to use this image

In your project, create a shell script for the RISC V compiler executable. You can name the file `riscv32-unknown-elf-gcc` which is the exact name of the RISC V compiler executable inside the Docker container. Put the following content inside of it.

```
#!/bin/sh
docker run --rm --entrypoint riscv32-unknown-elf-gcc --volume $PWD:/hostdir coderitter/pulp-riscv-gnu-toolchain "$@"
```

This call to `docker run` will create a temporary Docker container with the current directory mounted into it. It then executes the RISC V compiler executable and forwards any parameters which were made when the script was executed.

The last step is to set the permission of the file so that is executable.

```
chmod a+x riscv32-unknown-elf-gcc
```

Now you can use the script as if the compiler itself was installed on your host system. If the needed Docker image is not present, Docker will automatically download it from the Docker Hub.

```
./riscv32-unknown-elf-gcc -std=c99 -march=rv32imfdcxpulpv2 src -o build/firmware
```

You can also head to the [Coderitter GitHub repository](https://github.com/c0deritter/pulp-riscv-gnu-toolchain-docker) which contains ready-to-use shell script files including the one of this example.

## Directory structure and files

The PULP RISC-V GNU compiler toolchain is located in the directory `/opt/riscv`. The `PATH` variable is set to `/opt/riscv/bin` which contains all the RISC-V GNU compiler tools in executable form. Neither the source code of PULP RISC-V GNU compiler toolchain nor the required dependencies to compile it are included in this image.

## Environment variables

There are no environment variables that could be used for configuration.