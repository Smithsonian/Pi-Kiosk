# Pi-Kiosk

## Photo kiosk running on a Raspberry Pi

We are displaying some of the results from our digitization projects on a display at our office. This runs from a Rasperry Pi Zero W. The system runs on Raspbian lite (command line). It uses the `fbi` utility, which can be installed using:

```bash
sudo apt-get install fbi
```

To have it run automatically at boot, we added this line to the `.profile` file:

```bash
sudo fbi -T 2 --noverbose -t 8 -u images/*.jpg
```

This launches `fbi` and displays a new image every 8 seconds in a random order from the folder `/home/pi/images/`. The images were resized to 1080x1920 to avoid having to resize on the fly for the display. We are exploring options to display on 4k monitors using the Pi 3 B+. 

Then, we have these lines in the cron file:

```bash
0 17 * * 1-5 sudo killall fbi
0 17 * * 1-5 tvservice -o
0 8 * * 1-5 sudo shutdown -r now
```

 - The first line closes the `fbi` slideshow at 5PM
 - The second line shuts down the HDMI output so that the display can turn itself off and save power
 - The third line reboots the Pi at 8 in the morning on weekdays

More info and a more elegant solution coming soon.
