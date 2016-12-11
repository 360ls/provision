#!/bin/bash

dir="/tmp/.360ls"
video="${dir}/out.avi"

function finish() {
  rm -rf "${dir}"
}

trap finish EXIT

function setup() {
  echo "Setting up test directory..."
  rm -rf "${dir}"
  mkdir -p "${dir}"

  stitcher="https://raw.githubusercontent.com/360ls/desktop/master/app/services/stitcher.py"
  wget -O "${dir}/stitcher.py" "${stitcher}"
  chmod +x "${dir}/stitcher.py"
}

function test_preview() {
  echo "Testing Camera Preview..."
  opts="-p -i 1 --debug"

  cmd="${dir}/stitcher.py ${opts}"

  eval "${cmd}"

  if [ $? -eq 0 ]; then
    echo "Camera Preview Success ✓"
  else
    echo "Camera Preview Failed ✗"
  fi
}

function test_recording() {
  echo "Testing Video Recording..."
  opts="-p -i 1 -f ${video} --debug"

  cmd="${dir}/stitcher.py ${opts}"

  eval "${cmd}"

  if [ $? -eq 0 ]; then
    echo "Recording Success ✓"
  else
    echo "Recording Failed ✗"
  fi
}

function test_playback() {
  echo "Playing back recorded video..."
  opts="--playback -f ${video}"

  cmd="${dir}/stitcher.py ${opts}"

  eval "${cmd}"

  if [ $? -eq 0 ]; then
    echo "Playback Success ✓"
  else
    echo "Playback Failed ✗"
  fi
}

function main() {
  setup
  test_preview
  test_recording
  test_playback
}

main
