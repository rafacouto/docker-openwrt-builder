#!/bin/bash

cp "$WORKDIR/target-configs/$OPENWRT_TARGET.diff" \
	"$WORKDIR/.config" && exit 1

./scripts/feeds update -a && exit 1
./scripts/feeds install -a && exit 1 

PROCESSORS=$(cat /proc/cpuinfo | grep '^processor' | wc -l)
ionice -c 3 nice -n19 make -j $((PROCESSORS - 1))

