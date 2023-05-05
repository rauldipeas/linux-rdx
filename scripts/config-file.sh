#!/bin/bash
set -e

# Config file
cd linux*
#wget -qO .config https://raw.githubusercontent.com/xanmod/linux/6.0/CONFIGS/xanmod/gcc/config_x86-64-v3
#sed -i 's/x64v3/rdx/g' .config
#make olddefconfig

make defconfig

scripts/config --disable SYSTEM_TRUSTED_KEYS
scripts/config --disable SYSTEM_REVOCATION_KEYS
scripts/config --disable DEBUG_INFO
scripts/config --enable DEBUG_INFO_NONE

scripts/config --set-val CONFIG_LOGLEVEL_QUIET '0'
#sed -i 's/CONFIG_LOGLEVEL_QUIET=3/CONFIG_CONSOLE_LOGLEVEL_QUIET=0/g' .config
scripts/config --enable CONFIG_PREEMPT
#sed -i 's/# CONFIG_PREEMPT is not set/CONFIG_PREEMPT=y/g' .config
scripts/config --disable CONFIG_RETPOLINE
#sed -i 's/CONFIG_RETPOLINE=y/CONFIG_RETPOLINE=n/g' .config
scripts/config --disable CONFIG_SLS
#sed -i 's/CONFIG_SLS=y/CONFIG_SLS=n/g' .config
scripts/config --disable CONFIG_SPECULATION_MITIGATIONS
#sed -i 's/CONFIG_SPECULATION_MITIGATIONS=y/CONFIG_SPECULATION_MITIGATIONS=n/g' .config

cat .config