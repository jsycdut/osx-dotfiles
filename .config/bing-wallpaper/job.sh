#!/bin/bash
set -x

# api detail, see https://github.com/TimothyYe/bing-wallpaper
curl -o api-data.json https://bing.biturl.top?resolution=3840

today=`date "+%Y-%m-%d"`
file_name=${today}
extension=".jpg"
wallpaper_of_today=${file_name}${extension}

url=`python3 parse_url_from_json.py`

curl -o ${wallpaper_of_today} ${url}

directory="collection"
[[ ! -d ${directory} ]] && mkdir ${directory}

cp ${wallpaper_of_today} ${directory}
mv ${wallpaper_of_today} wallpaper.jpg

osascript set-wallpaper.scpt


