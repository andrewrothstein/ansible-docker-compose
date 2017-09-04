#!/usr/bin/env sh
VER=1.16.1
DIR=~/Downloads
MIRROR=https://github.com/docker/compose/releases/download
APP=docker-compose
for platform in Darwin-x86_64 Linux-x86_64 Windows-x86_64
do
    wget -O $DIR/$APP-$platform.$VER $MIRROR/$VER/$APP-$platform
done
sha256sum $DIR/$APP-*.$VER
#shasum -a 256 $DIR/$APP-*.$VER
