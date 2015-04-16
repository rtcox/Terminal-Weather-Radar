#!/bin/bash

#Set variables
DOWNLOAD_DIR=/tmp/weather/
WEATHER_GIF=http://archive.wfaa.com/weather/images/core/animated-loops/comp/880x495/new_tarrant.gif

COUNTER=0

#check for  download directory
if [ ! -d "$DOWNLOAD_DIR" ]; then
  mkdir -p $DOWNLOAD_DIR
fi

#remove old files
rm  $DOWNLOAD_DIR/*gif
rm  $DOWNLOAD_DIR/*.png
rm  $DOWNLOAD_DIR/*.txt

#get weather gif
wget $WEATHER_GIF -O "${DOWNLOAD_DIR}map.gif"

#extract gif to png
convert -coalesce "${DOWNLOAD_DIR}/map.gif" "${DOWNLOAD_DIR}/map.png"

#convert images to text
for i in $DOWNLOAD_DIR/map-*; do
   img2txt -f utf8 -W 100 -H 30 $i > $i.txt
done

#display images
while [ $COUNTER -lt 5 ] ; do
  for i in $DOWNLOAD_DIR/map-*.txt; do
     printf '\033[1;1H'
     cat $i
     sleep 0.5
  done
  let COUNTER=COUNTER+1
done
