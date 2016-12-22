
FROM debian:jessie

MAINTAINER Rafa Couto <caligari@treboada.net>

RUN apt-get update \
	&& apt-get -y install \
		git-core build-essential libssl-dev libncurses5-dev unzip \
		gawk subversion mercurial wget gettext \
	&& rm -rf /var/lib/apt/lists/*

ENV WORKDIR=/usr/local/openwrt

VOLUME ["$WORKDIR/src"]

ADD configs $WORKDIR/configs
ADD scripts $WORKDIR/scripts

WORKDIR $WORKDIR/src

CMD ["../scripts/build.sh"]


