#!/bin/bash
set -e

# Config file
cd linux*
wget -qO .config https://gitlab.com/xanmod/linux/-/raw/"$(wget -qO- https://kernel.org/|grep tar.xz|cut -d '"' -f2|head -n1|cut -d '/' -f8|cut -d '-' -f2|sed 's/.tar.xz//g'|cut -d '.' -f1-2)"/CONFIGS/x86_64/config
sed -i 's/x64v3/rdx/g' .config
make olddefconfig

# Misc settings
#scripts/config --enable DEBUG_INFO_NONE
#scripts/config --disable SYSTEM_REVOCATION_KEYS
#scripts/config --disable SYSTEM_TRUSTED_KEYS

# rtcqs settings
#scripts/config --set-val CONFIG_LOGLEVEL_QUIET '0'
#sed -i 's/CONFIG_LOGLEVEL_QUIET=3/CONFIG_CONSOLE_LOGLEVEL_QUIET=0/g' .config
#scripts/config --enable CONFIG_PREEMPT
#sed -i 's/# CONFIG_PREEMPT is not set/CONFIG_PREEMPT=y/g' .config
#scripts/config --disable CONFIG_RETPOLINE
#sed -i 's/CONFIG_RETPOLINE=y/CONFIG_RETPOLINE=n/g' .config
#scripts/config --disable CONFIG_SLS
#sed -i 's/CONFIG_SLS=y/CONFIG_SLS=n/g' .config
#scripts/config --disable CONFIG_SPECULATION_MITIGATIONS
#sed -i 's/CONFIG_SPECULATION_MITIGATIONS=y/CONFIG_SPECULATION_MITIGATIONS=n/g' .config

cat .config