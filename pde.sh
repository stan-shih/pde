#!/bin/bash
if [[ "$SHELL" =~ bin/zsh ]]; then
    echo "Can't support!!!"
fi
if [[ "$(uname)" = "Darwin" ]]; then
    # Mac OS X
    DIR=$(cd "$(dirname "${BASH_ARGV[0]}")"; pwd)
elif [[ "$(expr substr $(uname -s) 1 5)" = "Linux" ]] ; then
    # GNU/Linux
    echo Linux
elif [[ "$(expr substr $(uname -s) 1 5)" = "MINGW" ]] ; then
    # Windows NT
    DIR=$(dirname $(readlink -f "${BASH_SOURCE[0]}"))
fi
if [ ! -n $DIR ]; then
    echo "Can't support!!!"
fi
echo "Work Directory: "$DIR
if [[ "$DIR" == "/usr/bin" ]]; then
    DIR=/iisi-developer
    . $DIR/developer $*
else
    . $DIR/bin/setenv $*
    if [ "$DEV_HOME" != '' ] && [ "$1" != '' ]; then
        cd $DEV_HOME
    fi
fi

