#!/bin/bash
set -e
sudo apt autoremove --purge -y\
    azure-cli\
    '^dotnet-.*'\
    firefox\
    google-chrome-stable\
    '^llvm-.*'\
    powershell\
    snapd
    #google-cloud-sdk\
sudo apt clean
sudo swapoff -a
sudo rm -fr\
    "$AGENT_TOOLSDIRECTORY" \
    /opt/az \
    /usr/share/dotnet