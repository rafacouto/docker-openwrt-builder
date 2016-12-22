
# OpenWRT builder

This image provides a toolchain to build OpenWRT for different hardware devices.

## Get the docker image

### Pre-built image

    docker pull caligari/openwrt-builder

### From Dockerfile

    git clone git@github.com:rafacouto/docker-openwrt-builder.git
    docker build -t caligari/openwrt-builder:latest ./docker-openwrt-builder

## Usage

    docker run --rm caligari/openwrt-builder

### Docker volumes

    docker run -v $(pwd)/src:/usr/local/openwrt/src --rm caligari/openwrt-builder

will show the help:

    -ToDo-

### Compile an OpenWRT version to a hardware target

## Related info

- [OpenWRT wiki](https://wiki.openwrt.org/)

## Thanks

- [Javier Loureiro](https://twitter.com/StaticBoardsES) who had the idea for Raspberry Pi devices and provided config files for them.
- [OpenWRT community](https://openwrt.org/) for its great product.


