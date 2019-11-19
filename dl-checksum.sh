#!/usr/bin/env sh
VER=${1:-1.25.0}
DIR=~/Downloads
MIRROR=https://github.com/docker/compose/releases/download/$VER

dl()
{
    local os=$1
    local arch=$2
    local suffix=${3:-}
    local shafile=docker-compose-${os}-${arch}${suffix}.sha256
    local url=$MIRROR/$shafile

    printf "    # %s\n" $url
    printf "    %s-%s: sha256:%s\n" $os $arch `curl -sSL $url | awk '{print $1}'`
}

printf "  '%s':\n" $VER
dl Darwin x86_64
dl Linux x86_64
dl Windows x86_64 .exe


