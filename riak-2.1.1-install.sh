#!/bin/sh -x

ERL_BUILD=R16B02-basho8
./install-erlang.sh $ERL_BUILD git git://github.com/basho/otp.git OTP_R16B02_basho8
. $HOME/erlang/$ERL_BUILD/activate

if [ ! -d $HOME/riak/riak-2.1.1 ]; then
    wget http://s3.amazonaws.com/downloads.basho.com/riak/2.1/2.1.1/riak-2.1.1.tar.gz
    tar zxvf riak-2.1.1.tar.gz
    cd riak-2.1.1
    make locked-deps
    make rel
    cd ..

    mkdir -p $HOME/riak
    cp -a riak-2.1.1/rel/riak $HOME/riak/riak-2.1.1
else
    echo "Cached build found, using that."
fi
