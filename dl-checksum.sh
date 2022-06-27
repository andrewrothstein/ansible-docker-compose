#!/usr/bin/env sh
DIR=~/Downloads
MIRROR=https://github.com/docker/compose/releases/download

# https://github.com/docker/compose/releases/download/v2.0.1/docker-compose-linux-x86_64.sha256

dl()
{
    local ver=$1
    local os=$2
    local arch=$3
    local suffix=${4:-}
    local shafile=docker-compose-${os}-${arch}${suffix}.sha256
    local url=$MIRROR/v$ver/$shafile

    printf "    # %s\n" $url
    printf "    %s-%s: sha256:%s\n" $os $arch $(curl -sSLf $url | awk '{print $1}')
}

dl_ver() {
    ver=$1
    printf "  '%s':\n" $ver
    dl $ver darwin x86_64
    dl $ver linux x86_64
    dl $ver windows x86_64 .exe
}

dl_ver ${1:-2.6.1}
