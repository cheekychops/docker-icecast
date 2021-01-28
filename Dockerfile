FROM ubuntu:bionic

LABEL Colin Smith <smithcolina@gmail.com>

ENV DEBIAN_FRONTEND noninteractive
ENV IC_VERSION "2.4.0-kh15"

RUN apt-get -qq -y update && \
	apt-get -qq -y install sudo build-essential \
		wget curl libxml2-dev libxslt1-dev \
		libogg-dev libvorbis-dev libtheora-dev \
		libspeex-dev python-pip gettext-base

RUN pip install supervisor supervisor-stdout

RUN	wget "https://github.com/karlheyes/icecast-kh/archive/icecast-$IC_VERSION.tar.gz" -O- | tar zxvf - && \
	cd "icecast-kh-icecast-$IC_VERSION" && \
	./configure && \
	make && \
	make install

RUN useradd icecast

ADD ./start.sh /start.sh
ADD ./etc /etc

ENV ICECAST_LOCATION=Earth
ENV ICECAST_ADMIN=earthling@earth
ENV ICECAST_MAX_LISTENERS=1000
ENV ICECAST_MAX_SOURCES=2
ENV ICECAST_QUEUE_SIZE=524288
ENV ICECAST_CLIENT_TIMEOUT=30
ENV ICECAST_HEADER_TIMEOUT=5
ENV ICECAST_SOURCE_TIMEOUT=10
ENV ICECAST_BURST_ON_CONNECT=1
ENV ICECAST_BURST_SIZE=65535
ENV ICECAST_YP_URL_TIMEOUT=15
ENV ICECAST_YP_URL=http://dir.xiph.org/cgi-bin/yp-cgi
ENV ICECAST_HOSTNAME=localhost
ENV ICECAST_LISTEN_SOCKET=8000
ENV ICECAST_LOG_LEVEL=3
ENV ICECAST_LOG_SIZE=10000
ENV ICECAST_X_FORWARDED_FOR=*.*.*.*

CMD ["/start.sh"]
EXPOSE 8000
VOLUME ["/config", "/var/log/icecast"]
