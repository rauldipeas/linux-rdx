#!/bin/bash
set -e

# Linux source download

## Git
#git clone git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git linux-git
#cd linux*
#git checkout v"$(wget -qO- https://kernel.org/|grep tar.xz|cut -d '"' -f2|head -n1|cut -d '/' -f8|cut -d '-' -f2|sed 's/.tar.xz//g'|cut -d '.' -f1-2)"

## Tarball
#wget -q --show-progress "$(wget -qO- https://kernel.org/|grep tar.xz|cut -d '"' -f2|head -n1)"
wget -q --show-progress https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-6.18.9.tar.xz
tar xaf "$(wget -qO- https://kernel.org/|grep tar.xz|cut -d '"' -f2|head -n1|cut -d '/' -f8)"
rm "$(wget -qO- https://kernel.org/|grep tar.xz|cut -d '"' -f2|head -n1|cut -d '/' -f8)"