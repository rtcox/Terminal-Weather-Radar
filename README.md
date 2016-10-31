# Terminal-Weather-Radar

Downloads a gif of a weather radar, converts it to text and displays in the terminal.

Set WEATHER_GIF variable to a URL of a .gif of the weather radar of your desired area.

Set DOWNLOAD_DIR to the location you want to download the images. (default /tmp/weather/)

## Requirements

This requires the `convert` (from [ImageMagick](http://www.imagemagick.org/script/index.php))
and `img2txt` (from [libcaca](https://github.com/cacalabs/libcaca/blob/master/python/examples/img2txt.py))
commands.
