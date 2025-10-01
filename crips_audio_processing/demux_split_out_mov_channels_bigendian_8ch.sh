#!/bin/bash    

# Read a multichannel muxed movie file and split out each channel. 
# More secure than panning tricks, see crips_audio.txt for those

ffmpeg -i "$1" -vn -map 0:0 -f s24le -c:a pcm_s24le  "${1%.*}_str0.raw"
ffmpeg -f s24le -ac 1 -ar 48000 -i "${1%.*}_str0.raw" "${1%.*}_str0.wav"

ffmpeg -i "$1" -vn -map 0:1 -f s24le -c:a pcm_s24le  "${1%.*}_str1.raw"
ffmpeg -f s24le -ac 1 -ar 48000 -i "${1%.*}_str1.raw" "${1%.*}_str1.wav"

ffmpeg -i "$1" -vn -map 0:2 -f s24le -c:a pcm_s24le  "${1%.*}_str2.raw"
ffmpeg -f s24le -ac 1 -ar 48000 -i "${1%.*}_str2.raw" "${1%.*}_str2.wav"

ffmpeg -i "$1" -vn -map 0:3 -f s24le -c:a pcm_s24le  "${1%.*}_str3.raw"
ffmpeg -f s24le -ac 1 -ar 48000 -i "${1%.*}_str3.raw" "${1%.*}_str3.wav"

ffmpeg -i "$1" -vn -map 0:4 -f s24le -c:a pcm_s24le  "${1%.*}_str4.raw"
ffmpeg -f s24le -ac 1 -ar 48000 -i "${1%.*}_str4.raw" "${1%.*}_str4.wav"

ffmpeg -i "$1" -vn -map 0:5 -f s24le -c:a pcm_s24le  "${1%.*}_str5.raw"
ffmpeg -f s24le -ac 1 -ar 48000 -i "${1%.*}_str5.raw" "${1%.*}_str5.wav"

ffmpeg -i "$1" -vn -map 0:6 -f s24le -c:a pcm_s24le  "${1%.*}_str6.raw"
ffmpeg -f s24le -ac 1 -ar 48000 -i "${1%.*}_str6.raw" "${1%.*}_str6.wav"

ffmpeg -i "$1" -vn -map 0:7 -f s24le -c:a pcm_s24le  "${1%.*}_str7.raw"
ffmpeg -f s24le -ac 1 -ar 48000 -i "${1%.*}_str7.raw" "${1%.*}_str7.wav"
