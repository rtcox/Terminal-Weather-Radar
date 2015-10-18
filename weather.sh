#!/bin/bash

#Set variables
WEATHER_GIF=http://archive.wfaa.com/weather/images/core/animated-loops/comp/880x495/new_tarrant.gif

COUNTER=0

# Create a download directory for the images things. The version of mktemp on
# OS X *requires* a template, so we have to specify one. Since $TMPDIR isn't set
# on all OSes, we have to check for that, too.
TEMP_DIR=${TMPDIR:-/tmp}
DOWNLOAD_DIR=$(mktemp -d /${TEMP_DIR}/terminal-radar.XXXXX)
if [ ! -d "$DOWNLOAD_DIR" ]; then
  mkdir -p $DOWNLOAD_DIR
fi

#get weather gif
wget $WEATHER_GIF -O "${DOWNLOAD_DIR}/map.gif"

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

rm -rf ${DOWNLOAD_DIR}
