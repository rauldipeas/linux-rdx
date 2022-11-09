#!/bin/bash
set -e

# deb-pkg
cd linux*
make -j `getconf _NPROCESSORS_ONLN` deb-pkg