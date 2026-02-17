#!/bin/bash
set -e
# Linux RDX
rm linux-libc-dev_*_amd64.deb
mkdir -p meta-rdx/DEBIAN
META_VERSION="$(find "$PWD"/*rdx*.deb | head -n1 | cut -d "_" -f2 | cut -d "-" -f1)"
cat <<EOF | tee meta-rdx/DEBIAN/control >/dev/null
Package: linux-rdx
Version: $META_VERSION
Architecture: amd64
Maintainer: Raul Dipeas <rauldipeas@disroot.org>
Depends: linux-image-$META_VERSION-rdx, linux-headers-$META_VERSION-rdx
Section: kernel
Priority: optional
Description: Este pacote contém uma versão com pequenas modificações do kernel Linux, além de alguns patches de correções para o meu hardware pessoal.
EOF
dpkg-deb -b --root-owner-group meta-rdx .
rm -r meta-rdx #repack-*
for PACKAGE in *.deb; do
	curl -sF public=true -F package=@"$PACKAGE" https://"$GEMFURY_PUSH_TOKEN"@push.fury.io/rauldipeas/
done