#!/bin/bash
set -e

# bindeb-pkg
cd linux*
make -j "$(getconf _NPROCESSORS_ONLN)" bindeb-pkg #LOCALVERSION=-rdx