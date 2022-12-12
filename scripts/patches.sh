#!/bin/bash
set -e

# Patches
cd linux*

## M-Audio Fast Track C400
#patch -p1<../patches/99-m-audio_fast_track_c400-c600.patch