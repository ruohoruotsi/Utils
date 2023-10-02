#!/bin/bash

find . -name "*.wav" -exec sh -c 'ffmpeg -y -i "$1" -c:a flac "${1%.*}.flac" -hide_banner' sh {} \;
find . -name "*.wav" -exec cp {} /Volumes/RR/WAV_dump/ \;
