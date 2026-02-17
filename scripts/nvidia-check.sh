#!/bin/bash
set -e
KERNEL_SRC_DIR="$(pwd)"
KERNEL_VERSION="$(make -s kernelversion)"
nvidia_check() {
    LATEST_VERSION="$(curl -sSL https://download.nvidia.com/XFree86/Linux-x86_64/latest.txt)"
    DOWNLOAD_URL="https://download.nvidia.com/XFree86/Linux-x86_64/${LATEST_VERSION}/NVIDIA-Linux-x86_64-${LATEST_VERSION}.run"
    echo "Testando compatibilidade driver NVIDIA ${LATEST_VERSION} com kernel ${KERNEL_VERSION}"
    wget -q --show-progress "$DOWNLOAD_URL"
    chmod +x NVIDIA-Linux-x86_64-"${LATEST_VERSION}".run
    ./NVIDIA-Linux-x86_64-"${LATEST_VERSION}".run --extract-only
    cd NVIDIA-Linux-x86_64-"${LATEST_VERSION}"/kernel-open || return 1
    cd "${KERNEL_SRC_DIR}"
    make olddefconfig
    make modules_prepare
    cd -
    make -j"$(nproc)" \
        KERNEL_UNAME="${KERNEL_VERSION}" \
        SYSSRC="${KERNEL_SRC_DIR}" \
        modules 2>&1 | tee build.log
    return "${PIPESTATUS[0]}"
}
if nvidia_check; then
    echo "✅ Kernel ${KERNEL_VERSION} compatível com driver NVIDIA ${LATEST_VERSION}"
else
    echo "❌ Kernel ${KERNEL_VERSION} NÃO compatível com driver NVIDIA ${LATEST_VERSION}"
    exit 1
fi