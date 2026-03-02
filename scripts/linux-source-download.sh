#!/bin/bash
set -e

# Linux source download
## Tarball
LATEST_KERNEL="$(curl -s https://www.kernel.org/ | grep -A1 'longterm:' | grep -oP '\d+\.\d+\.\d+' | head -1)"
wget https://cdn.kernel.org/pub/linux/kernel/v"${LATEST_KERNEL%%.*}".x/linux-"${LATEST_KERNEL}".tar.xz
tar xaf linux-"${LATEST_KERNEL}".tar.xz
rm linux-"${LATEST_KERNEL}".tar.xz