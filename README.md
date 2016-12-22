
# OpenWRT builder

This image provides a toolchain to build OpenWRT for different hardware devices.

## Get the docker image

Prepare a disk volume with 15Gb free to execute this image. 

### Pull a pre-built image

    docker pull caligari/openwrt-builder:latest

Available [image tags here](https://hub.docker.com/r/caligari/openwrt-builder/tags/).


### From Dockerfile

    git clone git@github.com:rafacouto/docker-openwrt-builder.git
    docker build -t caligari/openwrt-builder:latest ./docker-openwrt-builder

## Usage

Show the __available targets to build__:

    docker run --rm caligari/openwrt-builder

_ToDo: put here the current output of this command._

__Build OpenWRT__ for a Raspberry Pi 3:

    docker run --rm -e OPENWRT_TARGET=rpi-3 caligari/openwrt-builder

## Docker volumes

### /usr/local/openwrt/src

Directory where OpenWRT sources persist (>= 15Gb):

    docker run \
        -e OPENWRT_TARGET=rpi-3 caligari/openwrt-builder \
        -v $(pwd)/src:/usr/local/openwrt/src

### /usr/local/openwrt/src/bin

Directory with the binaries result of the build:

    docker run \
        -e OPENWRT_TARGET=rpi-3 caligari/openwrt-builder \
        -v $(pwd)/binaries:/usr/local/openwrt/src/bin

## Docker variables

    docker run \
        -e OPENWRT_TARGET=rpi-3 \
        -e OPENWRT_RELEASE=master \
        -e JOBS=3 \
        caligari/openwrt-builder

- __OPENWRT\_TARGET__ Device configuration you are building OpenWRT for.
- __OPENWRT\_RELEASE__ OpenWRT version tag/branch to build (default is 'master').
- __JOBS__ Number of parallel jobs to launch with _make_.


## Related info

- [OpenWRT wiki](https://wiki.openwrt.org/)

## Thanks

- [Javi Loureiro](https://twitter.com/StaticBoardsES) who had the idea for Raspberry Pi devices and provided config files for them.
- [OpenWRT community](https://openwrt.org/) for the best embedded operating system based on the Linux kernel.


