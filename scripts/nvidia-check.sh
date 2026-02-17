#!/bin/bash
set -e

# Pega a versão mais recente do kernel
LATEST_KERNEL="$(curl -s https://www.kernel.org/finger_banner | grep 'latest stable version' | awk '{print $NF}')"
KERNEL_MAJOR="$(echo "$LATEST_KERNEL" | cut -d. -f1)"
echo "🔍 Baixando kernel ${LATEST_KERNEL}..."
wget -q --show-progress https://cdn.kernel.org/pub/linux/kernel/v"${KERNEL_MAJOR}".x/linux-"${LATEST_KERNEL}".tar.xz
tar xf linux-"${LATEST_KERNEL}".tar.xz
cd linux-"${LATEST_KERNEL}"
KERNEL_SRC_DIR="$(pwd)"
KERNEL_VERSION="$(make -s kernelversion)"
echo "🔍 Baixando driver NVIDIA..."
LATEST_VERSION="$(curl -s "https://download.nvidia.com/XFree86/Linux-x86_64/latest.txt")"
DOWNLOAD_URL="https://download.nvidia.com/XFree86/Linux-x86_64/${LATEST_VERSION}/NVIDIA-Linux-x86_64-${LATEST_VERSION}.run"
wget -q --show-progress "$DOWNLOAD_URL"
chmod +x NVIDIA-Linux-x86_64-"${LATEST_VERSION}".run
./NVIDIA-Linux-x86_64-"${LATEST_VERSION}".run --extract-only
echo "🧪 Testando NVIDIA ${LATEST_VERSION} com kernel ${KERNEL_VERSION}..."
make olddefconfig
make modules_prepare
cd NVIDIA-Linux-x86_64-"${LATEST_VERSION}"/kernel-open
if make -j"$(nproc)" KERNEL_UNAME="${KERNEL_VERSION}" SYSSRC="${KERNEL_SRC_DIR}" modules 2>&1 | tee build.log; then
    echo "✅ Compatível"
    exit 0
else
    echo "❌ Incompatível"
    exit 1
fi