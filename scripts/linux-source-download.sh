#!/bin/bash
set -e

# Linux source download
wget -qc https://cdn.kernel.org/pub/linux/kernel/v6.x/$(wget -qO- https://cdn.kernel.org/pub/linux/kernel/v6.x/|grep tar.xz|cut -d '"' -f2|tail -n2|head -n1)
tar xaf $(wget -qO- https://cdn.kernel.org/pub/linux/kernel/v6.x/|grep tar.xz|cut -d '"' -f2|tail -n2|head -n1)
rm $(wget -qO- https://cdn.kernel.org/pub/linux/kernel/v6.x/|grep tar.xz|cut -d '"' -f2|tail -n2|head -n1)