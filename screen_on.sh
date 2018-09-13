#!/bin/sh
tvservice --preferred > /dev/null
sudo supervisorctl start video_looper

#sudo shutdown -r now
