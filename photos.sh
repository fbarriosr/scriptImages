#!/bin/bash

# Find all types of imagery GIF, JPG, PNG
find . \( -iname "*.jpg" -o -iname "*.png" -o -iname "*.gif" \) -print0 | \
   while read -d $'\0' -r image; do
      read w h < <(sips -g pixelWidth -g pixelHeight "$image" | \
         awk '/Width:/{w=$2} /Height:/{h=$2} END{print w " " h}')
      
        if [ -z "$1" ] ; then
		  	if [[ $image != *@* ]]; then 
				  echo -e $image":\nw:"$w" \t h:"$h ;
		
			fi
		else 
			if [[ $image != *@* ]]; then
			  if [[ $image =~ $1 ]]; then
			  echo -e $image":\nw:"$w" \t h:"$h ;
			  fi
			fi 
		fi
       	
   done