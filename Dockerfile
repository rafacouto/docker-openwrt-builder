
FROM debian:jessie

MAINTAINER Rafa Couto <caligari@treboada.net>

RUN apt-get update \
	&& apt-get -y install \
		git-core build-essential libssl-dev libncurses5-dev unzip \
		gawk subversion mercurial wget gettext \
	&& rm -rf /var/lib/apt/lists/*

ENV OPENWRT_RELEASE=v15.05.1 \
	OPENWRT_TARGET=rpi3 \
	WORKDIR=/usr/src/openwrt

VOLUME ["$WORKDIR"]

ADD config $WORKDIR/target-configs
ADD scripts/* $WORKDIR/docker-scripts

RUN git clone --branch $OPENWRT_RELEASE \
	https://github.com/openwrt/openwrt.git $WORKDIR

WORKDIR $WORKDIR

CMD ["$WORKDIR/docker-scripts/build.sh", "$OPENWRT_TARGET"]


