#!/usr/bin/env sh
set -e
DIR=~/Downloads
MIRROR=https://github.com/docker/compose/releases/download

# https://github.com/docker/compose/releases/download/v2.10.0/checksums.txt

dl()
{
    local lchecksums=$1
    local ver=$2
    local os=$3
    local arch=$4
    local dotexe=${5:-}
    local platform="${os}-${arch}"
    local exe=docker-compose-${platform}${dotexe}
    # https://github.com/docker/compose/releases/download/v2.10.0/docker-compose-linux-x86_64
    local url=$MIRROR/v$ver/$exe

    printf "    # %s\n" $url
    printf "    %s: sha256:%s\n" $platform $(fgrep $exe $lchecksums | awk '{print $1}')
}

dl_ver() {
    ver=$1
    printf "  '%s':\n" $ver
    local lchecksums="${DIR}/docker-compose-${ver}-checksums.txt"
    if [ ! -e $lchecksums ];
    then
        curl -sSLf -o $lchecksums "${MIRROR}/v${ver}/checksums.txt"
    fi

    dl $lchecksums $ver darwin aarch64
    dl $lchecksums $ver darwin x86_64
    dl $lchecksums $ver linux aarch64
    dl $lchecksums $ver linux armv6
    dl $lchecksums $ver linux armv7
    dl $lchecksums $ver linux ppc64le
    dl $lchecksums $ver linux riscv64
    dl $lchecksums $ver linux s390x
    dl $lchecksums $ver linux x86_64
    dl $lchecksums $ver windows aarch64 .exe
    dl $lchecksums $ver windows x86_64 .exe
}

dl_ver ${1:-2.14.2}
