#!/bin/bash
set -e

# Config file
cd linux*
wget -qO .config https://raw.githubusercontent.com/xanmod/linux/6.0/CONFIGS/xanmod/gcc/config_x86-64-v3
sed -i 's/# CONFIG_PREEMPT is not set/CONFIG_PREEMPT=y/g' .config
sed -i 's/CONFIG_IRQ_FORCED_THREADING=y/CONFIG_IRQ_FORCED_THREADING=y/g' .config
sed -i 's/CONFIG_LOGLEVEL_QUIET=3/CONFIG_CONSOLE_LOGLEVEL_QUIET=0/g' .config
sed -i 's/CONFIG_RETPOLINE=y/CONFIG_RETPOLINE=n/g' .config
sed -i 's/CONFIG_SLS=y/CONFIG_SLS=n/g' .config
sed -i 's/CONFIG_SPECULATION_MITIGATIONS=y/CONFIG_SPECULATION_MITIGATIONS=n/g' .config
sed -i 's/x64v3/rdx/g' .config
make olddefconfig
#scripts/config --disable CONFIG_DEBUG_INFO
cat .config