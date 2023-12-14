# Pi-Kiosk

## Photo kiosk running on a Raspberry Pi

We are displaying some of the results from our digitization projects on a display at our office. This runs from a Rasperry Pi Zero W. The system runs on Raspbian lite (command line). It uses the `fbi` utility, which can be installed using:

```bash
sudo apt-get install fbi
```

To have it run automatically at boot, we added this line to the `/etc/rc.local` file:

```bash
sudo fbi -T 2 --noverbose -t 12 -u /home/pi/images/*.jpg
```

This launches `fbi` and displays a new image every 8 seconds in a random order from the folder `/home/pi/images/`. 

Then, we have these lines in the cron file:

```bash
0 17 * * 1-5 sudo killall fbi
0 17 * * 1-5 tvservice -o
0 8 * * 1-5 sudo shutdown -r now
30 17 * * 5 root apt-get update && apt-get upgrade -y >> /var/log/apt_update.log
```

 - The first line closes the `fbi` slideshow at 5PM
 - The second line shuts down the HDMI output so that the display can turn itself off and save power
 - The third line reboots the Pi at 8 in the morning on weekdays
 - The fourth line updates the system every Friday

To enable 4K displays, edit or add these lines to the config.txt file in the Raspberry boot partition:

```bash
# Boost HDMI signal
config_hdmi_boost=4
#Increase video memory
gpu_mem=256

#For 4k monitors
hdmi_group=2
hdmi_mode=87
hdmi_cvt 3840 2160 24
framebuffer_width=3840
framebuffer_height=2160
max_framebuffer_width=3840
max_framebuffer_height=2160
hdmi_pixel_freq_limit=400000000

#Turn off BT
dtoverlay=pi3-disable-bt
```
