#!/bin/bash
set -e
sudo apt autoremove --purge -y\
    azure-cli\
    '^dotnet-.*'\
    firefox\
    google-chrome-stable\
    google-cloud-sdk\
    hhvm\
    '^llvm-.*'\
    powershell\
    snapd
sudo apt clean
sudo swapoff -a
sudo rm -rf\
    "$AGENT_TOOLSDIRECTORY"\
    /opt/az\
    /swapfile\
    /usr/share/dotnet\
    /usr/local/share/boost