#!/bin/bash
set -e

# Linux source download
wget -qc --show-progress $(wget -qO- https://kernel.org/|grep tar.xz|cut -d '"' -f2|head -n1)
tar xaf $(wget -qO- https://kernel.org/|grep tar.xz|cut -d '"' -f2|head -n1|cut -d '/' -f8)
rm $(wget -qO- https://kernel.org/|grep tar.xz|cut -d '"' -f2|head -n1|cut -d '/' -f8)