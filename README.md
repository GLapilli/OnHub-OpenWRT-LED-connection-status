# OnHub-OpenWRT-LED-connection-status
Simple script that uses status LED on Onhub router (tested on TP-Link) running OpenWRT to display connection status, since that's a feature that wasn't 
The script pings 8.8.8.8 once every three seconds to check wether there's internet connection or not. If there is connection, it shows a static light blue ring. When connection is lost, shows a red ring.

## Steps to make it work:

1- Download file Internet_check.sh somewhere to your computer
2- Copy it to your Onhub router* to `/etc/Internet_check.sh`
3- Login via ssh to your router as root and change the file permissions via 
```
chmod 755 /etc/Internet_check
```
4- Edit `/etc/rc.local`. This can be done either from Luci (System->Startup->Local Startup Tab), or using `vi /etc/rc.local`. Make sure you add the following line right before `exit 0` at the end:
```
/bin/sh /etc/Internet_check.sh &
```
5- Reboot and enjoy!

## Backup script along with your Openwrt configuration
If you would like this script to be a part of your Onhub OpenWRT backup configuration files, all you need to do is edit `/etc/sysupgrade.conf` and add the line `/etc/Internet_check.sh`

## Copying file from Linux
Navigate to folder and use `scp Internet_check.sh root@192.168.1.1:/etc` where 192.168.1.1 is your Onhub IP

## Copying file from Windows
Open PowerShell, navigate to the folder where you downloaded the file and use `scp Internet_check.sh root@192.168.1.1:/etc` where 192.168.1.1 is your Onhub IP
