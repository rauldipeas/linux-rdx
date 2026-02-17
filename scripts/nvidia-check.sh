#!/bin/bash
set -e
find "$PWD" -name '*rdx*.deb'
sudo apt install -y "$PWD"/linux-image*.deb "$PWD"/linux-headers*.deb
deb_check() {
	echo "🧪 Testando NVIDIA ${LATEST_VERSION} com kernel ${KERNEL_VERSION}..."
	sudo dpkg --add-architecture i386
	wget -q --show-progress "https://developer.download.nvidia.com/compute/cuda/repos/debian13/x86_64/$(curl -sSL https://developer.download.nvidia.com/compute/cuda/repos/debian13/x86_64/ | grep cuda-keyring | cut -d \' -f4)"
	sudo apt install "$PWD"/cuda-keyring*.deb
	sudo apt update
	sudo apt install -t Debian_13 \
		libnvidia-encode1 \
		libvulkan1 \
		libvulkan1:i386 \
		nvidia-kernel-open-dkms \
		nvidia-open \
		nvidia-settings \
		nvidia-vaapi-driver \
		nvtop
		update-iniramfs -u -k all
}
if deb_check ; then
    echo "✅ Compatível"
    exit 0
else
    echo "❌ Incompatível"
    exit 1
fi