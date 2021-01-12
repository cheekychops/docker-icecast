#!/bin/sh

env

set -x

if [ -n "$ICECAST_SOURCE_PASSWORD" ]; then
    sed -i "s/<source-password>[^<]*<\/source-password>/<source-password>$ICECAST_SOURCE_PASSWORD<\/source-password>/g" /etc/icecast.xml
fi

if [ -n "$ICECAST_RELAY_PASSWORD" ]; then
    sed -i "s/<relay-password>[^<]*<\/relay-password>/<relay-password>$ICECAST_RELAY_PASSWORD<\/relay-password>/g" /etc/icecast.xml
fi

if [ -n "$ICECAST_ADMIN_PASSWORD" ]; then
    sed -i "s/<admin-password>[^<]*<\/admin-password>/<admin-password>$ICECAST_ADMIN_PASSWORD<\/admin-password>/g" /etc/icecast.xml
fi

if [ -n "$ICECAST_PASSWORD" ]; then
    sed -i "s/<password>[^<]*<\/password>/<password>$ICECAST_PASSWORD<\/password>/g" /etc/icecast.xml
fi

if [ -n "$ICECAST_LOCATION" ]; then
    sed -i "s/<location>[^<]*<\/location>/<location>$ICECAST_LOCATION<\/location>/g" /etc/icecast.xml
fi

if [ -n "$ICECAST_HOSTNAME" ]; then
    sed -i "s/<hostname>[^<]*<\/hostname>/<hostname>$ICECAST_HOSTNAME<\/hostname>/g" /etc/icecast.xml
fi

if [ -n "$ICECAST_ADMIN" ]; then
    sed -i "s/<admin>[^<]*<\/admin>/<admin>$ICECAST_ADMIN<\/admin>/g" /etc/icecast.xml
fi

if [ -n "$ICECAST_MAX_SOURCES" ]; then
    sed -i "s/<sources>[^<]*<\/sources>/<sources>$ICECAST_MAX_SOURCES<\/sources>/g" /etc/icecast.xml
fi

if [ -n "$ICECAST_MAX_LISTENERS" ]; then
    sed -i "s/<clients>[^<]*<\/clients>/<clients>$ICECAST_MAX_LISTENERS<\/clients>/g" /etc/icecast.xml
fi

if [ -n "$ICECAST_X_FORWARDED_FOR" ]; then
    sed -i "s/<x-forwarded-for><\/x-forwarded-for>/<x-forwarded-for>$ICECAST_X_FORWARDED_FOR<\/x-forwarded-for>/g" /etc/icecast.xml
fi

if [ -n "$ICECAST_LOG_LEVEL" ]; then
    sed -i "s/<loglevel>3<\/loglevel>/<loglevel>$ICECAST_LOG_LEVEL<\/loglevel>/g" /etc/icecast.xml
fi


cat /etc/icecast.xml

chown -R icecast /var/log/icecast
supervisord -n -c /etc/supervisord.conf
