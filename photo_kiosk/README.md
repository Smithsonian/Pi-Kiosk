# Pi-Kiosk

## Photo kiosk running on a Raspberry Pi

We are displaying some of the results from our digitization projects on a display at our office. This runs from a Rasperry Pi Zero W. The system runs on Raspbian lite (command line). It is set up to log in automatically to the `pi` user. **Change the user password, never use it with the default password. This is a security risk.** Then, enable SSH, connect the Pi to the Wifi and make note of the IP address. 

Then, just copy the images via SFTP to the folder `/home/pi/images/`.

Install the `fbi` utility:

```bash
sudo apt-get install fbi
```

To have it run automatically at boot, we add this line to the `.profile` file:

```bash
sudo fbi -T 2 --noverbose -t 8 -u images/*.jpg
```

This launches `fbi` and displays a new image every 8 seconds in a random order from the folder `/home/pi/images/`. 

Then, add these lines to crontab:

```bash
0 17 * * 1-5 sudo killall fbi
0 17 * * 1-5 tvservice -o
0 8 * * 1-5 sudo shutdown -r now
```

 - The first line closes the `fbi` application at 5PM
 - The second line shuts down the HDMI output so that the display can turn itself off and save power
 - The third line reboots the Pi at 8 in the morning on weekdays

More info and a more elegant solution coming soon.