#!/bin/bash -x

curl -O https://raw.githubusercontent.com/spawngrid/kerl/master/kerl
chmod a+x kerl

./kerl build git git://github.com/basho/otp.git OTP_R16B02_basho8 R16B02-basho8 &
buildpid=$!

LOGFILE="$HOME/.kerl/builds/R16B02-basho8/otp_build.log"
while [ ! -e $LOGFILE ]; do
    sleep 1
done
tail -f $LOGFILE &
tailpid=$!
wait $buildpid
kill $tailpid

./kerl install R16B02-basho8 ~/erlang/R16B02-basho8

ls ~/erlang
