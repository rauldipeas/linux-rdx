#!/bin/bash
set -e
sudo apt install libelf-dev liblz4-tool #bison build-essential flex libncurses-dev libssl-dev
#bison flex libfl-dev libfl2 liblz4-tool libncurses-dev libssl-dev lz4 m4
wget -c https://cdn.kernel.org/pub/linux/kernel/v6.x/$(wget -qO- https://cdn.kernel.org/pub/linux/kernel/v6.x/|grep tar.xz|cut -d '"' -f2|tail -n2|head -n1)
tar xavf $(wget -qO- https://cdn.kernel.org/pub/linux/kernel/v6.x/|grep tar.xz|cut -d '"' -f2|tail -n2|head -n1)
cd ./linux-$(wget -qO- https://cdn.kernel.org/pub/linux/kernel/v6.x/|grep tar.xz|cut -d '"' -f2|tail -n2|head -n1|sed 's/linux-//g'|sed 's/.tar.xz//g')
patch -p1<../99-m-audio_fast_track_c400-c600.patch
wget -O .config wget https://kernel.ubuntu.com/~kernel-ppa/config/jammy/linux/$(wget -qO- https://kernel.ubuntu.com/~kernel-ppa/config/jammy/linux/|grep href|cut -d '"' -f8|tail -n1)amd64-config.flavour.lowlatency
sed -i 's/CONFIG_DEFAULT_HOSTNAME/#CONFIG_DEFAULT_HOSTNAME/g' .config
make olddefconfig
scripts/config --disable DEBUG_INFO
make -j `getconf _NPROCESSORS_ONLN` deb-pkg LOCALVERSION=-rdx