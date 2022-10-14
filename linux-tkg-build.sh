#!/bin/bash
set -e
git clone https://github.com/Frogging-Family/linux-tkg
cd linux-tkg
cp ../linux-tkg-customization.cfg customization.cfg
yes|./install.sh install
