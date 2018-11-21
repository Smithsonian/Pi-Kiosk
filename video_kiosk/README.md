# Pi-Kiosk

## Video kiosk running on a Raspberry Pi

We are using the Adafruit [Raspberry Pi Video Looper](https://learn.adafruit.com/raspberry-pi-video-looper/).

To shutoff the video display at the end of the day, we have these lines in the `/etc/crontab` file:

```bash
0 17 * * 1-5 root supervisorctl stop video_looper
3 17 * * 1-5 root vcgencmd display_power 0
10 16 * * 5 root apt update && apt upgrade -y >> /var/log/apt_update.log
0 8  * * 1-5 root shutdown -r now
```

 - The first line shutsdown the video player at 5PM
 - The second line shuts down the HDMI output so that the display can turn itself off and save power
 - The next line updates the system on Fri afternoon
 - The last line reboots the Pi at 8 in the morning on weekdays

