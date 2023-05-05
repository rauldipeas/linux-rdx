#!/bin/bash
set -e

# Linux source download
git clone git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git linux-git
cd linux*
git checkout v"$(wget -qO- https://kernel.org/|grep tar.xz|cut -d '"' -f2|head -n1|cut -d '/' -f8|cut -d '-' -f2|sed 's/.tar.xz//g'|cut -d '.' -f1-2)"
wget -qc --show-progress $(wget -qO- https://kernel.org/|grep tar.xz|cut -d '"' -f2|head -n1)
tar xaf $(wget -qO- https://kernel.org/|grep tar.xz|cut -d '"' -f2|head -n1|cut -d '/' -f8) -C .
rm $(wget -qO- https://kernel.org/|grep tar.xz|cut -d '"' -f2|head -n1|cut -d '/' -f8)