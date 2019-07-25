#!/usr/bin/env sh
VER=1.24.1
DIR=~/Downloads
MIRROR=https://github.com/docker/compose/releases/download/$VER

dl()
{
    OS=$1
    ARCH=$2
    SUFFIX=${3:-}
    SHAFILE=docker-compose-${OS}-${ARCH}${SUFFIX}.sha256
    URL=$MIRROR/$SHAFILE

    printf "    # %s\n" $URL
    printf "    %s-%s: sha256:%s\n" $OS $ARCH `curl -sSL $URL | awk '{print $1}'`
}

printf "  '%s':\n" $VER
dl Darwin x86_64
dl Linux x86_64
dl Windows x86_64 .exe


