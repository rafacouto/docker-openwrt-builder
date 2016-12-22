#!/bin/bash

OPENWRT_SRC="$WORKDIR/src"
OPENWRT_CONFIGS="$WORKDIR/configs"

# ToDo: show target options
if [ -z "$OPENWRT_TARGET" ] ; then
	echo 'ERROR: You have to set the environment variable OPENWRT_TARGET to one of these values:'
	for c in $(ls $OPENWRT_CONFIGS | sed 's/\.diff//g') ; do
		echo "$c"
	done
	exit
fi

# ToDo: examine targets from env vars...


# get the sources
git clone https://github.com/openwrt/openwrt.git $OPENWRT_SRC
cd $OPENWRT_SRC
git checkout $OPENWRT_RELEASE 

# set the config file
cp "$OPENWRT_CONFIGS/$OPENWRT_TARGET.diff" "$OPENWRT_SRC/.config" 

# update feeds
./scripts/feeds update -a 
./scripts/feeds install -a 

PROCESSORS=$(cat /proc/cpuinfo | grep '^processor' | wc -l)
JOBS=$(($PROCESSORS - 1))

# compile
time ionice -c 3 nice -n 19 make -j $JOBS V=s

