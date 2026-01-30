#!/bin/bash
set -e

# Config file
cd linux*
#wget -qO .config https://gitlab.com/xanmod/linux/-/raw/"$(wget -qO- https://kernel.org/|grep tar.xz|cut -d '"' -f2|head -n1|cut -d '/' -f8|cut -d '-' -f2|sed 's/.tar.xz//g'|cut -d '.' -f1-2)"/CONFIGS/x86_64/config
#sed -i 's/x64v3/rdx/g' .config
#make olddefconfig
#make defconfig

echo 'deb http://deb.debian.org/debian sid main' | sudo tee /etc/apt/sources.list.d/debian.list
sudo apt update
sudo apt install -y --allow-unauthenticated linux-image-amd64

cp /boot/config-"$(find /boot/config-* | tail -n1 | sed 's/.*config-//')" .config
sudo rm /etc/apt/sources.list.d/debian.list
sudo apt update

#make x86_64_defconfig
#make olddefconfig

# rdx suffix
#sed -i 's/^EXTRAVERSION *=.*/EXTRAVERSION = -rdx/' Makefile

# Misc settings
## LOGLEVEL e PREEMPT
#sed -i 's/^CONFIG_LOGLEVEL_QUIET=.*/CONFIG_LOGLEVEL_QUIET=0/' .config
#sed -i 's/^# CONFIG_LOGLEVEL_QUIET is not set/CONFIG_LOGLEVEL_QUIET=0/' .config
#sed -i 's/^CONFIG_PREEMPT=.*/CONFIG_PREEMPT=y/' .config
#sed -i 's/^# CONFIG_PREEMPT is not set/CONFIG_PREEMPT=y/' .config
## Desativa mitigations
#sed -i '/^CONFIG_RETPOLINE=/d' .config
#sed -i '/^# CONFIG_RETPOLINE is not set/d' .config
#echo "# CONFIG_RETPOLINE is not set" >> .config
#sed -i '/^CONFIG_SLS=/d' .config
#sed -i '/^# CONFIG_SLS is not set/d' .config
#echo "# CONFIG_SLS is not set" >> .config
#sed -i '/^CONFIG_SPECULATION_MITIGATIONS=/d' .config
#sed -i '/^# CONFIG_SPECULATION_MITIGATIONS is not set/d' .config
#echo "# CONFIG_SPECULATION_MITIGATIONS is not set" >> .config
## Ativa DEBUG_INFO_NONE
#sed -i '/^CONFIG_DEBUG_INFO_NONE=/d' .config
#sed -i '/^# CONFIG_DEBUG_INFO_NONE is not set/d' .config
#echo "CONFIG_DEBUG_INFO_NONE=y" >> .config
## Desativa chaves de confiança do sistema
#for opt in CONFIG_SYSTEM_REVOCATION_KEYS CONFIG_SYSTEM_TRUSTED_KEYS; do
#  sed -i "/^$opt=/d" .config
#  sed -i "/^# $opt is not set/d" .config
#  echo "# $opt is not set" >> .config
#done

# rtcqs settings
#sed -i 's/^CONFIG_LOGLEVEL_QUIET=.*/CONFIG_LOGLEVEL_QUIET=0/' .config
#sed -i 's/^# CONFIG_LOGLEVEL_QUIET is not set/CONFIG_LOGLEVEL_QUIET=0/' .config
#sed -i 's/^CONFIG_PREEMPT=.*/CONFIG_PREEMPT=y/' .config
#sed -i 's/^# CONFIG_PREEMPT is not set/CONFIG_PREEMPT=y/' .config

#make olddefconfig