#!/bin/bash    

# Read a multichannel muxed movie file and split out each channel. 
# More secure than panning tricks, see crips_audio.txt for those

ffmpeg -i "$1" -vn \
    -map 0:0 -f s24le -c:a pcm_s24le  "${1%.*}_2ch.raw"

ffmpeg -f s24le -ac 2 -i "${1%.*}_2ch.raw" "${1%.*}_mono.wav" 