#!/bin/bash

set -e

mkdir -p ~/gstreamer-build
cd ~/gstreamer-build

[ ! -d gstreamer ] && git clone https://github.com/GStreamer/gstreamer.git 


cd gstreamer


meson setup build
meson compile -C build
