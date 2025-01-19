#!/bin/zsh

if [[ "$SHELL" == "/bin/bash" ]]; then
    cur=$(pwd)
    echo "Please execute pde.sh!!!"
    exit 1
fi
echo PDE execute with zsh
##
##
if [[ "$(uname)" = "Darwin" ]]; then
    # Mac OS X
    DIR=$(cd "$(dirname "${BASH_ARGV[0]}")"; pwd)
    if [[ "$SHELL_NAME" == "zsh" ]]; then
        DIR=$(cd "$(dirname "$(readlink -f "$0")")"; pwd)
    fi
elif [[ "$(expr substr $(uname -s) 1 5)" = "Linux" ]] ; then
    # GNU/Linux
    echo Linux
elif [[ "$(expr substr $(uname -s) 1 5)" = "MINGW" ]] ; then
    # Windows NT
    DIR=$(dirname $(readlink -f "${BASH_SOURCE[0]}"))
fi
if [ ! -n $DIR ]; then
    echo "Can't support!!!"
    exit 0
fi
PDE_DIR=$DIR
echo "Work Directory: "$PDE_DIR
if [[ -f $PDE_DIR/bin/pdemain ]]; then
    echo "Can't get path of PDE!!!"
    exit 0
fi

bash --init-file <(echo 'source ~/pde/bin/pdemain')
