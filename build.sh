#!/bin/bash
set -e
sudo apt install libelf-dev liblz4-tool #bison build-essential flex libncurses-dev libssl-dev
#bison flex libfl-dev libfl2 liblz4-tool libncurses-dev libssl-dev lz4 m4
git clone https://github.com/xanmod/linux
cd linux
patch -p1<../99-m-audio_fast_track_c400-c600.patch
cp ../config-6.0.2-edge .config
make olddefconfig
scripts/config --disable CONFIG_DEBUG_INFO
make -j `getconf _NPROCESSORS_ONLN` deb-pkg LOCALVERSION=-rdx