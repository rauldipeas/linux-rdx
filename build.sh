#!/bin/bash
set -e
sudo apt install libelf-dev liblz4-tool #bison build-essential flex libncurses-dev libssl-dev
#bison flex libfl-dev libfl2 liblz4-tool libncurses-dev libssl-dev lz4 m4
wget -c https://cdn.kernel.org/pub/linux/kernel/v6.x/$(wget -qO- https://cdn.kernel.org/pub/linux/kernel/v6.x/|grep tar.xz|cut -d '"' -f2|tail -n2|head -n1)
tar xavf $(wget -qO- https://cdn.kernel.org/pub/linux/kernel/v6.x/|grep tar.xz|cut -d '"' -f2|tail -n2|head -n1)
cd ./linux-$(wget -qO- https://cdn.kernel.org/pub/linux/kernel/v6.x/|grep tar.xz|cut -d '"' -f2|tail -n2|head -n1|sed 's/linux-//g'|sed 's/.tar.xz//g')
cp ../sound-usb-implicit-c400-fix.c sound/usb/implicit.c
make CC=clang defconfig
make CC=clang -j `getconf _NPROCESSORS_ONLN` deb-pkg LOCALVERSION=-rdx