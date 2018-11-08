# cardashcam
Car dashcam for Raspberry Pi

Step 1. 
Enable your camera, ssh, ir2c in using "sudo raspi-config" then reboot.
Step 2. 
Now edit go in and edit your /boot/config.txt as the one shown in this git.
Step 3. 
Edit your modules file "/etc/modules" adding the addtional line as shown in the git. Then edit rc.local in the same directory as before.
Step 4.
Head to home/pi/ and type nano .off_button.py and enter all the file information there. (Line 10 shows pin 21 this is for model 3 b version 2.0) correct yours as needed. a link to find the correct ones is http://www.hobbytronics.co.uk/raspberry-pi-gpio-pinout
Step 5.
Now to create your actual files for recording and deleting.
mkdir /home/pi/CamProj
mkdir /home/pi/CamProj/video
mkdir /home/pi/CamProj/scripts
mkdir /home/pi/CamProj/scripts/shell
nano /home/pi/CamProj/scripts/shell/record.sh (copy the contents of record.sh to this file)
nano /home/pi/CamProj/scripts/shell/delete.sh  (copy the contents of delete.sh to this file)

Step 6.
Head over to lib/systemd/system and create two files one being called camdelete.service and the other camproj.service.
Copy the contents to these files.

Now exit and save.
Next type sudo systemctl enable camdelete.service and sudo systemctl enable camproj.service
next sudo systemctl daemon-reload

then reboot.

It will now work. press your push button to shutdown safely. If you need to pull videos from the pi type in console.

MP4box -add /home/pi/CamProj/videos/NAME OF YOUR VIDEO.h264 /home/pi/CamProj/videos/video.mp4
