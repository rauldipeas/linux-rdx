#!/bin/bash
set -e
# Linux RDX
rm linux-libc-dev_*_amd64.deb
#dpkg-deb -x linux-image-*-rdx_*_amd64.deb repack-image
#dpkg-deb -e linux-image-*-rdx_*_amd64.deb repack-image/DEBIAN
#rm linux-image-*-rdx_*_amd64.deb
#sed -i "s/linux-image-.*/linux-image-rdx/g" repack-image/DEBIAN/control
#dpkg-deb -b --root-owner-group repack-image .
#dpkg-deb -x linux-headers-*-rdx_*_amd64.deb repack-headers
#dpkg-deb -e linux-headers-*-rdx_*_amd64.deb repack-headers/DEBIAN
#rm linux-headers-*-rdx_*_amd64.deb
#sed -i "s/linux-headers-.*/linux-headers-rdx/g" repack-headers/DEBIAN/control
#dpkg-deb -b --root-owner-group repack-headers .
mkdir -p meta-rdx/DEBIAN
META_VERSION="$(find ./*rdx*.deb | head -n1 | cut -d "_" -f2 | cut -d "-" -f1)"
BUILD='1'
cat <<EOF | tee meta-rdx/DEBIAN/control >/dev/null
Package: linux-rdx
Version: $META_VERSION-$BUILD
Architecture: amd64
Maintainer: Raul Dipeas <rauldipeas@disroot.org>
Depends: linux-image-$META_VERSION-$BUILD, linux-headers-$META_VERSION-$BUILD
Section: kernel
Priority: optional
Description: Este pacote contém uma versão com pequenas modificações do kernel Linux, além de alguns patches de correções para o meu hardware pessoal.
EOF
dpkg-deb -b --root-owner-group meta-rdx .
rm -r meta-rdx #repack-*
for PACKAGE in *.deb; do
	curl -sF package=@"$PACKAGE" https://"$GEMFURY_PUSH_TOKEN"@push.fury.io/rauldipeas/
done