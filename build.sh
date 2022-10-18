#!/bin/bash
set -e
sudo apt install libelf-dev liblz4-tool #bison build-essential flex libncurses-dev libssl-dev
#bison flex libfl-dev libfl2 liblz4-tool libncurses-dev libssl-dev lz4 m4
wget -c https://cdn.kernel.org/pub/linux/kernel/v6.x/$(wget -qO- https://cdn.kernel.org/pub/linux/kernel/v6.x/|grep tar.xz|cut -d '"' -f2|tail -n2|head -n1)
tar xavf $(wget -qO- https://cdn.kernel.org/pub/linux/kernel/v6.x/|grep tar.xz|cut -d '"' -f2|tail -n2|head -n1)
cd ./linux-$(wget -qO- https://cdn.kernel.org/pub/linux/kernel/v6.x/|grep tar.xz|cut -d '"' -f2|tail -n2|head -n1|sed 's/linux-//g'|sed 's/.tar.xz//g')
cp ../kernel-config .config
#cp -rfv ../revertions/kernel-tree/drivers .
rm -rfv drivers/gpu/drm/amd/pm/powerplay/hwmqr/smu7_hwmgr.c
rm -rfv drivers/gpu/drm/amd/pm/powerplay/hwmqr/vega10_hwmgr.c
rm -rfv drivers/gpu/drm/amd/pm/powerplay/hwmqr/vega12_hwmgr.c
rm -rfv drivers/gpu/drm/amd/pm/powerplay/hwmqr/vega20_hwmgr.c
rm -rfv mm/z3fold.c
rm -rfv security/integrity/iintc.c
make olddefconfig
make -j `getconf _NPROCESSORS_ONLN` deb-pkg LOCALVERSION=-rdx