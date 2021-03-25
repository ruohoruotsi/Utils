#!/usr/bin/env bash

inputdir=./webms/*.webm
outputdir=./wavs

# rename files if they have spaces in the filename
# for f in ${inputdir}; do mv "$f" `echo $f | tr ' ' '_'`; done

mkdir -p ${outputdir}
for webmfile in ${inputdir}
do
	# echo "${webmfile}"
	# echo "$(basename $webmfile)"
	outputfilename="$(basename $webmfile)"
	ffmpeg -i "${webmfile}" -vn ${outputdir}/"${outputfilename%.*}.wav"; 
done
