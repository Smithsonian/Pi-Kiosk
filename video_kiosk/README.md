# Pi-Kiosk

## Video kiosk running on a Raspberry Pi

We are using the Adafruit [Raspberry Pi Video Looper](https://learn.adafruit.com/raspberry-pi-video-looper/).

To shutoff the video display at the end of the day, we have these lines in the cron file:

```bash
0 17 * * 1-5 sudo supervisorctl stop video_looper
0 17 * * 1-5 tvservice -o
0 8 * * 1-5 sudo shutdown -r now
```

 - The first line shutsdown the video player at 5PM
 - The second line shuts down the HDMI output so that the display can turn itself off and save power
 - The third line reboots the Pi at 8 in the morning on weekdays

More info and a more elegant solution coming soon.
