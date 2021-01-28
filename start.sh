#!/bin/sh

envsubst < /etc/icecast.xml.template > /etc/icecast.xml

cat /etc/icecast.xml

chown -R icecast /var/log/icecast
chown -R icecast /etc/icecast.xml

supervisord -n -c /etc/supervisord.conf
