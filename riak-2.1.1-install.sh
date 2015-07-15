#!/bin/sh -x

./install-erlang.sh

wget http://s3.amazonaws.com/downloads.basho.com/riak/2.1/2.1.1/riak-2.1.1.tar.gz
tar zxvf riak-2.1.1.tar.gz
cd riak-2.1.1
make rel
