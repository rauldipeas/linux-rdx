#!/bin/bash
set -e
bash -x scripts/setup-host.sh
bash -x scripts/linux-source-download.sh
bash -x scripts/patches.sh
bash -x scripts/config-file.sh
bash -x scripts/bindeb-pkg.sh
bash -x scripts/nvidia-check.sh
bash -x scripts/upload.sh