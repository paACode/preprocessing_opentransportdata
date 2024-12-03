#!/bin/bash

#Select Filter
filter="ist-daten-2024" 

#Apply Filter
bash get_zip_file_links.sh | grep "$filter" | 

#Download
while read -r url; do 
	wget  -P ./downloads "$url"
done

