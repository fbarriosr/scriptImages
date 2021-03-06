#!/bin/bash

find . \( -iname "*.jpg" -o -iname "*.png" -o -iname "*.gif" \) -print0 | \
   while read -d $'\0' -r image; do
      read w h < <(sips -g pixelWidth -g pixelHeight "$image" | \
         awk '/Width:/{w=$2} /Height:/{h=$2} END{print w " " h}')
      echo $image $w $h 
   done