# Pi-Kiosk - Displays at DPO Office

To help display the results of the projects by DPO, we are testing and adding new technologies at our office. 

## Cooper-Hewitt interactive table

We are running an interactive display that the Cooper-Hewitt Museum uses to display their items. The museum has several tables that display images from many of the items that the museum has, including details and links to similar or related objects.

The interactive Table system is being shown on a 32" touchscreen. It is driven running on an Intel NUC system, because of its small size and technical specs. Although the Table system was developed for Windows, we were able to run it on Ubuntu Linux 16.04 using Wine. Using winetricks, we installed 'vcrun2013' and run the table display at startup using this script:

```bash
#!/usr/bin/env bash

sleep 4s
wine $HOME/.wine/drive_c/Local\ Projects/apps/CollectionsTable/CollectionsTable.exe &
sleep 2s

#Quick hack to click a dialog button
xdotool mousemove 960 590 click 1 click 1 &
```

To control the power, we are using the following lines on `/etc/crontab`:

```bash
#from https://askubuntu.com/a/940208
#Shutdown on mon-thurs at 5pm and wake up at 8am next day
00 17 * * 1-4 root /usr/sbin/rtcwake -m off -s 54000
#Shutdown on friday at 5pm and wake up at 8am on monday
00 17 * * 5 root /usr/sbin/rtcwake -m off -s 226800
```

## Video Kiosk

We are testing Raspberry Pi computers to provide a video kiosk at a very low cost. In addition, the kiosk can be easily automated and updated as needed. For more details:

 * [Video Kiosk](video_kiosk)

## Photo Kiosk 

We are testing Raspberry Pi computers to display 4K photos of some of the items digitized by the Mass Digitization program at DPO. 

* [Photo Kiosk](photo_kiosk)
