#!/bin/bash
set -e

# Config file
cd linux*
wget -qO .config https://raw.githubusercontent.com/xanmod/linux/6.0/CONFIGS/xanmod/gcc/config_x86-64-v3
sed -i 's/x64v3/rdx/g' .config
make olddefconfig
scripts/config --disable CONFIG_DEBUG_INFO
scripts/config --enable CONFIG_IRQ_FORCED_THREADING
scripts/config --set-val CONFIG_LOGLEVEL_QUIET 0
scripts/config --enable CONFIG_PREEMPT
scripts/config --disable CONFIG_RETPOLINE
scripts/config --disable CONFIG_SLS
scripts/config --disable CONFIG_SPECULATION_MITIGATIONS
cat .config