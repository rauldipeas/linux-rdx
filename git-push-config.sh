#!/bin/bash
set -e
git remote add origin https://codeberg.org/rauldipeas/linux-rdx
git remote set-url --add --push origin https://codeberg.org/rauldipeas/linux-rdx
git remote set-url --add --push origin https://github.com/rauldipeas/linux-rdx
git push --set-upstream origin main