#!/bin/sh -x

ERL_BUILD=R16B02-basho8
./install-erlang.sh $ERL_BUILD git git://github.com/basho/otp.git OTP_R16B02_basho8
. $HOME/erlang/$ERL_BUILD/activate

RIAK_CACHE_DIR="$HOME/riak/riak-2.1.1"

# Once-off to kill bad cache.
rm -rf $RIAK_CACHE_DIR
if [ ! -d $RIAK_CACHE_DIR ]; then
    wget http://s3.amazonaws.com/downloads.basho.com/riak/2.1/2.1.1/riak-2.1.1.tar.gz
    tar zxvf riak-2.1.1.tar.gz
    cd riak-2.1.1
    make locked-deps
    make rel
    cd ..

    mkdir -p $HOME/riak
    cp -a riak-2.1.1/rel/riak $RIAK_CACHE_DIR
else
    echo "Cached build found, using that."
fi

cp -a $RIAK_CACHE_DIR riak
