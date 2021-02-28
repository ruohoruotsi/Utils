#!/bin/bash    

# Read a multichannel broadcast wave file and split out each channel. 
# More secure than panning tricks, see crips_audio.txt for those

num_channels=`soxi -c "$1"`

if [ "$num_channels" = 1 ]; then
    echo "mono, exiting"
    exit;
fi

if [ "$num_channels" = 2 ]; then
    echo "stereo, downmixing"
    sox "$1" -c 1 "${1%.*}_mono.wav" 
    exit;
fi


for i in $(seq 1 "$num_channels"); 
do 
    
    if [ "$i" = 3 ]; then 
	echo "${1%.*}_center.wav";
	sox "$1" "${1%.*}_center.wav" remix "$i"
    else
	echo "${1%.*}_${i}.wav";
	sox "$1" "${1%.*}_${i}.wav" remix "$i"
    fi
done

# sox infile.wav outfile.1.wav remix 1
# sox infile.wav outfile.2.wav remix 2
# sox infile.wav outfile.3.wav remix 3
# sox infile.wav outfile.4.wav remix 4


# This also works, but it'll covert it to 16bit if it was 24bit to start with
# not ideal. Apparently, one cannot do copy in ffmpeg & also apply a filter.
# So we use sox above

# ffmpeg -i "$1"  \
#  -map_channel 0.0.0 "${1}_wav0.wav" \
#  -map_channel 0.0.1 "${1}_wav1.wav" \
#  -map_channel 0.0.2 "${1%.*}_center.wav" \
#  -map_channel 0.0.3 "${1}_wav3.wav" \
#  -map_channel 0.0.4 "${1}_wav4.wav" \
#  -map_channel 0.0.5 "${1}_wav5.wav" # \
#  -map_channel 0.0.6 "${1}_wav6.wav" \
#  -map_channel 0.0.7 "${1}_wav7.wav"
