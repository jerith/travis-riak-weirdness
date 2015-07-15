#!/bin/sh -x

./install-erlang.sh

wget http://s3.amazonaws.com/downloads.basho.com/riak/1.4/1.4.12/riak-1.4.12.tar.gz
tar zxvf riak-1.4.12.tar.gz
cd riak-1.4.12
make rel
