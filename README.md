# OnHub-OpenWRT-LED-connection-status
Script that uses status LED on Onhub router (tested on TP-Link) running OpenWRT to display connection status

Steps to make it work:

1- Download file Internet_check.sh somewhere to your computer
2- Copy it to your Onhub router to /etc/Internet_check.sh
3- Login via ssh to your router as root and change the file permissions via 
'''
chmod 755 /etc/Internet_check
'''
4- Edit '/etc/rc.local'. This can be done either from Luci (System->Startup->Local Startup Tab), or using 'vi /etc/rc.local'. Make sure you add the following line right before 'exit 0' at the end:
'''
/bin/sh /etc/Internet_check.sh &
'''
5- Reboot and enjoy!