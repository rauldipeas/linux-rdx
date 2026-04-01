#!/bin/bash
set -e
bash scripts/setup-host.sh
bash scripts/linux-source-download.sh
bash scripts/patches.sh
bash scripts/config-file.sh
bash scripts/bindeb-pkg.sh
bash scripts/nvidia-check.sh
bash scripts/upload.sh