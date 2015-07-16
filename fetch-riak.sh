#!/bin/sh

RIAK_VERSION="$1"
RIAK_FILENAME=riak-${RIAK_VERSION}-precise.tgz
RIAK_DOWNLOAD=$HOME/download/$RIAK_FILENAME

if [ ! -f $RIAK_DOWNLOAD ]; then
    mkdir -p $HOME/download
    wget -O $RIAK_DOWNLOAD http://jerith.za.net/files/riak/$RIAK_FILENAME
fi

tar xzf $RIAK_FILENAME
