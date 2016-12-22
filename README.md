
# OpenWRT builder

This image provides a toolchain to build OpenWRT for different hardware devices.

## Get the docker image

Prepare a disk volume with 15Gb free to execute this image. 

### From Dockerfile

    git clone git@github.com:rafacouto/docker-openwrt-builder.git
    docker build -t caligari/openwrt-builder:latest ./docker-openwrt-builder

## Usage

    docker run --rm -e OPENWRT_TARGET=rpi-3 caligari/openwrt-builder

shows the help:

    -ToDo-

### Docker volumes

    docker run -v $(pwd)/src:/usr/local/openwrt/src \
        -e OPENWRT_TARGET=rpi-3 caligari/openwrt-builder

- /usr/local/openwrt/src Directory where OpenWRT sources persist (>= 15Gb).

### Docker variables

    docker run \
        -e OPENWRT_TARGET=rpi-3 \
        -e OPENWRT_RELEASE=master \
        -e JOBS=3 \
        caligari/openwrt-builder

- OPENWRT\_TARGET Device configuration you are building OpenWRT for.
- OPENWRT\_RELEASE OpenWRT version tag/branch to build (default is 'master').
- JOBS Number of parallel jobs to launch with _make_

### Compile an OpenWRT version to a hardware target

## Related info

- [OpenWRT wiki](https://wiki.openwrt.org/)

## Thanks

- [Javi Loureiro](https://twitter.com/StaticBoardsES) who had the idea for Raspberry Pi devices and provided config files for them.
- [OpenWRT community](https://openwrt.org/) for the best embedded operating system based on the Linux kernel.


