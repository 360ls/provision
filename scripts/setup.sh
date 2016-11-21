#!/bin/bash

BASE_DIR=".360ls"
RECORDING_DIR="recordings"
STITCHER_URL="https://raw.githubusercontent.com/360ls/desktop/sprint4/integration/app/services/stitcher.py"

mkdir -p ~/${BASE_DIR}
mkdir -p ~/${BASE_DIR}/${RECORDING_DIR}

cd ~/${BASE_DIR}
curl -s -o stitcher.py ${STITCHER_URL}
chmod +x stitcher.py
