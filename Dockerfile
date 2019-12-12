FROM ubuntu:bionic

# Based on the Dockerfile by Manfred Touron "m@42.am"
MAINTAINER Colin Smith <smithcolina@gmail.com>

RUN apt-get -qq -y update && \
    apt-get -qq -y install icecast2 python-setuptools sudo cron-apt && \
    apt-get -y autoclean && \
    apt-get clean && \
    chown -R icecast2 /etc/icecast2 && \
    sed -i 's/ -d//' /etc/cron-apt/action.d/3-download

CMD ["/start.sh"]
EXPOSE 8000
VOLUME ["/config", "/var/log/icecast2", "/etc/icecast2"]

ADD ./start.sh /start.sh
ADD ./etc /etc
