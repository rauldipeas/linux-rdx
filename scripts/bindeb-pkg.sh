#!/bin/bash
set -e
cd linux*
make -j "$(getconf _NPROCESSORS_ONLN)" bindeb-pkg LOCALVERSION=-rdx