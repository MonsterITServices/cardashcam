#!/bin/sh
sudo modprobe bcm2835-v4l2 
file_name=/home/pi/CamProj/video/

for i in `seq 1 1 100` 
do
   	echo "Welcome $i times..."

	current_time=$(date "+%b-%d-%Y_%H.%M.%S")
	echo "Current Time : $current_time"
	 
	new_fileName=$file_name$current_time.h264
	echo "New FileName: " "$new_fileName"
	
	#This was the toughest part of the whole project to find the optimal settings for recording.
	raspivid -a 12 -ae 32,0xff,0x808000 -o $new_fileName -w 1280 -h 720 -t 1800000

	echo "Done with recording..."

done
 
