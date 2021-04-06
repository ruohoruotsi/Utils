#!/bin/bash    

# Read a multichannel muxed movie file and split out each channel. 
# More secure than panning tricks, see crips_audio.txt for those

ffmpeg -i "$1" -vn \
    -map 0:0 -f s24le -c:a pcm_s24le "${1}_wav0.raw" \
    -map 0:1 -f s24le -c:a pcm_s24le "${1}_wav1.raw" \
    -map 0:2 -f s24le -c:a pcm_s24le "${1%.*}_center.raw" \
    -map 0:3 -f s24le -c:a pcm_s24le "${1}_wav3.raw" \
    -map 0:4 -f s24le -c:a pcm_s24le "${1}_wav4.raw" \
    -map 0:5 -f s24le -c:a pcm_s24le "${1}_wav5.raw" 

ffmpeg -f s24le -i "${1%.*}_center.raw" "${1%.*}_center.wav" 