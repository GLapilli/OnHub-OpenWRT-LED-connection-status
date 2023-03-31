#!/bin/bash
#
#Turns off all LEDs first
/bin/echo "0" > /sys/class/leds/red:status-0/brightness
/bin/echo "0" > /sys/class/leds/red:status-1/brightness
/bin/echo "0" > /sys/class/leds/red:status-2/brightness
/bin/echo "0" > /sys/class/leds/red:status-3/brightness
/bin/echo "0" > /sys/class/leds/red:status-4/brightness
/bin/echo "0" > /sys/class/leds/red:status-5/brightness
/bin/echo "0" > /sys/class/leds/blue:status-0/brightness
/bin/echo "0" > /sys/class/leds/blue:status-1/brightness
/bin/echo "0" > /sys/class/leds/blue:status-2/brightness
/bin/echo "0" > /sys/class/leds/blue:status-3/brightness
/bin/echo "0" > /sys/class/leds/blue:status-4/brightness
/bin/echo "0" > /sys/class/leds/blue:status-5/brightness
/bin/echo "0" > /sys/class/leds/green:status-0/brightness
/bin/echo "0" > /sys/class/leds/green:status-1/brightness
/bin/echo "0" > /sys/class/leds/green:status-2/brightness
/bin/echo "0" > /sys/class/leds/green:status-3/brightness
/bin/echo "0" > /sys/class/leds/green:status-4/brightness
/bin/echo "0" > /sys/class/leds/green:status-5/brightness
/bin/echo "0" > /sys/class/leds/ath10k-phy0/brightness
/bin/echo "0" > /sys/class/leds/ath10k-phy1/brightness
/bin/echo "0" > /sys/class/leds/ath10k-phy2/brightness

#Flag that allows to update only on status change
flag="start"

while :
do

#pings 8.8.8.8 only once, with a 3 second timeout.
ping -c1 -q -W3 8.8.8.8 
status=$?;
case $status in
    0)
        echo "host is alive";
    ;;
    1)
        echo "network unreachable or host not responding to pings";
    ;;
    2)
        echo "No route to host or other error";
    ;;
esac

if [ $status -eq 0 ]; then
	if [ $flag != "up" ] ; then
		/bin/echo "Internet is up"
		logger "Internet is up"
		flag="up"
	# Brightness can be set to any value between 0 and 255
	# RGB colors can be obtained from here. 
    /bin/echo "128" > /sys/class/leds/green:status-0/brightness
	/bin/echo "128" > /sys/class/leds/green:status-1/brightness
	/bin/echo "128" > /sys/class/leds/green:status-2/brightness
	/bin/echo "128" > /sys/class/leds/green:status-3/brightness
	/bin/echo "128" > /sys/class/leds/green:status-4/brightness
	/bin/echo "128" > /sys/class/leds/green:status-5/brightness
    /bin/echo "128" > /sys/class/leds/blue:status-0/brightness
	/bin/echo "128" > /sys/class/leds/blue:status-1/brightness
	/bin/echo "128" > /sys/class/leds/blue:status-2/brightness
	/bin/echo "128" > /sys/class/leds/blue:status-3/brightness
	/bin/echo "128" > /sys/class/leds/blue:status-4/brightness
	/bin/echo "128" > /sys/class/leds/blue:status-5/brightness
	/bin/echo "0" > /sys/class/leds/red:status-0/brightness
	/bin/echo "0" > /sys/class/leds/red:status-1/brightness
	/bin/echo "0" > /sys/class/leds/red:status-2/brightness
	/bin/echo "0" > /sys/class/leds/red:status-3/brightness
	/bin/echo "0" > /sys/class/leds/red:status-4/brightness
	/bin/echo "0" > /sys/class/leds/red:status-5/brightness
	fi
else
    if [ $flag != "down" ] ; then
		/bin/echo "Internet is down"
		logger "Internet is down"
		flag="down"
    /bin/echo "0" > /sys/class/leds/green:status-0/brightness
	/bin/echo "0" > /sys/class/leds/green:status-1/brightness
	/bin/echo "0" > /sys/class/leds/green:status-2/brightness
	/bin/echo "0" > /sys/class/leds/green:status-3/brightness
	/bin/echo "0" > /sys/class/leds/green:status-4/brightness
	/bin/echo "0" > /sys/class/leds/green:status-5/brightness
	/bin/echo "0" > /sys/class/leds/blue:status-0/brightness
	/bin/echo "0" > /sys/class/leds/blue:status-1/brightness
	/bin/echo "0" > /sys/class/leds/blue:status-2/brightness
	/bin/echo "0" > /sys/class/leds/blue:status-3/brightness
	/bin/echo "0" > /sys/class/leds/blue:status-4/brightness
	/bin/echo "0" > /sys/class/leds/blue:status-5/brightness
	/bin/echo "255" > /sys/class/leds/red:status-0/brightness
	/bin/echo "255" > /sys/class/leds/red:status-1/brightness
	/bin/echo "255" > /sys/class/leds/red:status-2/brightness
	/bin/echo "255" > /sys/class/leds/red:status-3/brightness
	/bin/echo "255" > /sys/class/leds/red:status-4/brightness
	/bin/echo "255" > /sys/class/leds/red:status-5/brightness
	fi
fi
sleep 3
done
