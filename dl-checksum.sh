#!/usr/bin/env sh
DIR=~/Downloads
MIRROR=https://github.com/docker/compose/releases/download

dl()
{
    local ver=$1
    local os=$2
    local arch=$3
    local suffix=${4:-}
    local shafile=docker-compose-${os}-${arch}${suffix}.sha256
    local url=$MIRROR/$ver/$shafile

    printf "    # %s\n" $url
    printf "    %s-%s: sha256:%s\n" $os $arch $(curl -sSL $url | awk '{print $1}')
}

dl_ver() {
    ver=$1
    printf "  '%s':\n" $ver
    dl $ver Darwin x86_64
    dl $ver Linux x86_64
    dl $ver Windows x86_64 .exe
}


dl_ver ${1:-1.25.5}
