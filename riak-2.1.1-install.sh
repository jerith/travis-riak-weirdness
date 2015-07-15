#!/bin/sh -x

ls
curl -O https://raw.githubusercontent.com/spawngrid/kerl/master/kerl
ls
chmod a+x kerl

./kerl build git git://github.com/basho/otp.git OTP_R16B02_basho8 R16B02-basho8

ls ~/erlang

./kerl install R16B02-basho8 ~/erlang/R16B02-basho8

ls ~/erlang

. ~/erlang/R16B02-basho8/activate


wget http://s3.amazonaws.com/downloads.basho.com/riak/2.1/2.1.1/riak-2.1.1.tar.gz
tar zxvf riak-2.1.1.tar.gz
cd riak-2.1.1
make rel
