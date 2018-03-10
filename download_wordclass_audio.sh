#!/bin/bash

read -p 'Video Link: ' videolink
read -p 'Number of segments: ' numberOfSegments

for (( i=1; i<=$numberOfSegments; i++ ))
do
 curl -O $videolink"segment-"$i".ts"
 echo "file 'segment-"$i".ts'" >> mylist.txt 

done

ffmpeg -f concat -i mylist.txt -c copy output.ts

ffmpeg -i output.ts file.mp3

#cleanup 
rm output.ts
rm mylist.txt

echo "======>>> file.mp3 contains your Audio Podcast"