#!/bin/bash    

# Read a multichannel muxed movie file and split out each channel. 
# More secure than panning tricks, see crips_audio.txt for those

ffmpeg -i "$1" -vn \
  -map 0:0 -c copy "${1}_wav0.wav" # \
#  -map 0:1 -c copy "${1}_wav1.wav" # \
#  -map 0:2 -c copy "${1%.*}_center.wav" \
#  -map 0:3 -c copy "${1}_wav3.wav" \
#  -map 0:4 -c copy "${1}_wav4.wav" \
#  -map 0:5 -c copy "${1}_wav5.wav" # \
#  -map 0:6 -c copy "${1}_wav6.wav" \
#  -map 0:7 -c copy "${1}_wav7.wav"


