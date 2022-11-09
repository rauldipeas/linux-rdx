#!/bin/bash
set -e

# Config file
cd linux*
wget -qO .config https://raw.githubusercontent.com/xanmod/linux/6.0/CONFIGS/xanmod/gcc/config_x86-64-v3
sed -i 's/x64v3/rdx/g' .config
scripts/config --set-val CONFIG_DEBUG_INFO 'n'
scripts/config --set-val CONFIG_IRQ_FORCED_THREADING 'y'
scripts/config --set-val CONFIG_LOGLEVEL_QUIET '0'
scripts/config --set-val CONFIG_PREEMPT 'y'
scripts/config --set-val CONFIG_RETPOLINE 'n'
scripts/config --set-val CONFIG_SLS 'n'
scripts/config --set-val CONFIG_SPECULATION_MITIGATIONS 'n'
make olddefconfig
cat .config