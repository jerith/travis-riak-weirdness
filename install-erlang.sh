#!/bin/bash -x

curl -O https://raw.githubusercontent.com/spawngrid/kerl/master/kerl
chmod a+x kerl

ERL_BUILD="$1"; shift

if [ ! -d $HOME/erlang/$ERL_BUILD ]; then
    ./kerl build "$@" "$ERL_BUILD" &
    buildpid=$!

    if [ "$1" = "git" ]; then
        LOGFILE="$HOME/.kerl/builds/$ERL_BUILD/otp_build.log"
    else
        LOGFILE="$HOME/.kerl/builds/$ERL_BUILD/otp_build_$1.log"
    fi
    while [ ! -e $LOGFILE ]; do
        sleep 10
    done
    tail -f $LOGFILE &
    tailpid=$!
    wait $buildpid
    kill $tailpid

    ./kerl install "$ERL_BUILD" "$HOME/erlang/$ERL_BUILD"
else
    echo "Cached build found, using that."
fi

ls ~/erlang
