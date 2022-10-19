#!/bin/bash
set -e
git clone https://github.com/Frogging-Family/linux-tkg
cd linux-tkg
cp ../customizations.cfg .
cp ../install.sh .
mkdir linux602-tkg-userpatches
cp ../99-m-audio_fast_track_c400-c600.patch linux602-tkg-userpatches/99-m-audio_fast_track_c400-c600.mypatch
./install.sh install