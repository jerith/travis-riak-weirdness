#!/bin/sh -x

ERL_BUILD=r15b01
./install-erlang.sh $ERL_BUILD R15B01
. $HOME/erlang/$ERL_BUILD/activate

RIAK_CACHE_DIR="$HOME/riak/riak-1.4.12"

if [ ! -d $RIAK_CACHE_DIR ]; then
    wget http://s3.amazonaws.com/downloads.basho.com/riak/1.4/1.4.12/riak-1.4.12.tar.gz
    tar zxvf riak-1.4.12.tar.gz
    cd riak-1.4.12
    make rel
    cd ..

    mkdir -p $HOME/riak
    cp -a riak-1.4.12/rel/riak $RIAK_CACHE_DIR
else
    echo "Cached build found, using that."
fi

cp -a $RIAK_CACHE_DIR riak
