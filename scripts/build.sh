#!/bin/bash

# ToDo: show target options

# ToDo: test target config

cp "$WORKDIR/target-configs/$OPENWRT_TARGET.diff" \
	"$WORKDIR/.config" && exit 1

./scripts/feeds update -a && exit 1
./scripts/feeds install -a && exit 1 

ionice -c 3 nice -n19 make -j1 V=s

