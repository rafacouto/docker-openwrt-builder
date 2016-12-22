#!/bin/bash

# ToDo: show target options

# ToDo: examine targets from env vars...

export OPENWRT_SRC="$WORKDIR/src"

# get the sources
git clone https://github.com/openwrt/openwrt.git $OPENWRT_SRC
cd $OPENWRT_SRC
git checkout $OPENWRT_RELEASE 

# set the config file
cp "$WORKDIR/configs/$OPENWRT_TARGET.diff" "$OPENWRT_SRC/.config" 

# update feeds
./scripts/feeds update -a 
./scripts/feeds install -a 

# compile
ionice -c 3 nice -n19 make -j3 V=s

