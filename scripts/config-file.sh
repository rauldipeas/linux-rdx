#!/bin/bash
set -e

# Config file
cd linux*
wget -q "$(curl -s http://ftp.debian.org/debian/pool/main/d/debian-archive-keyring/ | grep -oP 'debian-archive-keyring_[0-9.]+_all\.deb' | sort -V | tail -1 | sed 's|^|http://ftp.debian.org/debian/pool/main/d/debian-archive-keyring/|')"
sudo apt install -y ./debian-archive-keyring_*.deb
echo 'deb http://deb.debian.org/debian sid main' | sudo tee /etc/apt/sources.list.d/debian.list
sudo apt update
apt download linux-image-amd64
KERNEL_PKG="$(dpkg-deb -I linux-image-amd64*.deb | grep "Depends:" | grep -oP 'linux-image-[^ ,]+')"
apt download "$KERNEL_PKG"
dpkg-deb -x "${KERNEL_PKG}"*.deb extracted/
cp extracted/boot/config-* .config
rm -rf extracted/ ./*.deb
sudo rm /etc/apt/sources.list.d/debian.list
sudo apt update

# Misc settings
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
sed -i '/^CONFIG_DEBUG_INFO_NONE=/d' .config
sed -i '/^# CONFIG_DEBUG_INFO_NONE is not set/d' .config
echo "CONFIG_DEBUG_INFO_NONE=y" >> .config

## Desativa chaves de confiança do sistema
#for opt in CONFIG_SYSTEM_REVOCATION_KEYS CONFIG_SYSTEM_TRUSTED_KEYS; do
#  sed -i "/^$opt=/d" .config
#  sed -i "/^# $opt is not set/d" .config
#  echo "# $opt is not set" >> .config
#done

## rtcqs settings
sed -i 's/^CONFIG_LOGLEVEL_QUIET=.*/CONFIG_LOGLEVEL_QUIET=0/' .config
sed -i 's/^# CONFIG_LOGLEVEL_QUIET is not set/CONFIG_LOGLEVEL_QUIET=0/' .config
sed -i 's/^CONFIG_PREEMPT=.*/CONFIG_PREEMPT=y/' .config
sed -i 's/^# CONFIG_PREEMPT is not set/CONFIG_PREEMPT=y/' .config