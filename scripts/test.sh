#!/bin/bash

dir="/tmp/.360ls"
video="${dir}/out.avi"
index=0
pause=3

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
  opts="-p -i ${index} --debug"

  cmd="${dir}/stitcher.py ${opts}"

  eval "${cmd}"

  if [ $? -eq 0 ]; then
    print_success "Camera Preview Success ✓"
  else
    print_fail "Camera Preview Failed ✗"
  fi
}

function test_recording() {
  echo "Testing Video Recording..."
  opts="-p -i ${index} -f ${video} --debug"

  cmd="${dir}/stitcher.py ${opts}"

  eval "${cmd}"

  if [ $? -eq 0 ]; then
    print_success "Recording Success ✓"
  else
    print_fail "Recording Failed ✗"
  fi
}

function test_playback() {
  echo "Playing back recorded video..."
  opts="--playback -f ${video}"

  cmd="${dir}/stitcher.py ${opts}"

  eval "${cmd}"

  if [ $? -eq 0 ]; then
    print_success "Playback Success ✓"
  else
    print_fail "Playback Failed ✗"
  fi
}

function test_stream() {
  echo "Streaming camera..."
  opts="-i ${index} -s --url rtmp://54.227.214.22:1935/live/myStream -f ${video} --debug"

  cmd="${dir}/stitcher.py ${opts}"

  eval "${cmd}"

  if [ $? -eq 0 ]; then
    print_success "Stream Success ✓"
  else
    print_fail "Stream Failed ✗"
  fi
}

function print_success() {
  GREEN='\033[0;32m'
  NC='\033[0m'
  printf "${GREEN}$1${NC}\n"
}

function print_fail() {
  RED='\033[0;31m'
  NC='\033[0m'
  printf "${RED}$1${NC}\n"
}

function main() {
  setup

  test_preview
  test_recording

  sleep "${pause}"
  test_playback

  rm -f "${video}"

  test_stream
  sleep "${pause}"

  test_playback
}

main
