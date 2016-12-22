#!/bin/bash

# ToDo: show target options

# ToDo
echo 'ToDo: examine targets from env vars...'
exit 0

# get the sources
git clone https://github.com/openwrt/openwrt.git $WORKDIR/src
git checkout $OPENWRT_RELEASE 

# set the config file
cp "$WORKDIR/target-configs/$OPENWRT_TARGET.diff" \
	"$WORKDIR/src/.config" && exit 1

# update feeds
./scripts/feeds update -a && exit 1
./scripts/feeds install -a && exit 1 

# compile
ionice -c 3 nice -n19 make -j3 V=s

