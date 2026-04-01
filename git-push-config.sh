#!/bin/bash
set -e
git remote add origin https://codeberg.org/rauldipeas/linux-rdx
git remote set-url --add --push origin https://codeberg.org/rauldipeas/linux-rdx
git remote set-url --add --push origin https://rauldipeas@dev.azure.com/rauldipeas/Linux%20RDX/_git/Linux%20RDX
git push --set-upstream origin main