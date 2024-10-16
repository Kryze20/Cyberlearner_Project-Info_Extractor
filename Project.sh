#!/bin/bash

#Purpose of this script is show the machine's information.
#It is meant to be beginner friendly, so that all the user needs to do is to run the script without any further user inputs.

#sleep 2 will induce a 2 second pause so that information will not be shown overwhelmingly.

#1. This is to show the Public Address of the machine.
echo "Your Public IP Address is: $(curl ifconfig.me)"
sleep 2

#This is to create a line break for easier reading.
echo''

#2. This is to show the Private IP Address of the machine.
echo "Your Private IP Address is: $(ifconfig | grep broadcast | awk '{print $2}')"
sleep 2

echo''

#3. This is to show the MAC Address (2nd half) of the machine.
echo "Your MAC Address is: $(ifconfig eth0 | grep ether | awk '{print $2}' | awk -F: '{print $4,$5,$6}')"
sleep 2

echo''

#4. This is to show the Top 5 processes utilizing the CPU.
echo "The CPU usage for the top 5 processes are: 
$(ps -eo comm,%cpu --sort=-%cpu | head -n6)"
sleep 2

echo''

#5. This is to show both total and available Memory on the machine.
echo "The total and available memory is: 
$(cat /proc/meminfo | head -n2)"
sleep 2

echo''

#6. This is to show active system services and their status.
echo "The active system services and their status ([ + ]-running) are: 
$(service --status-all)"
sleep 2

echo''

#7. This is to show the Top 10 largest files in the /home directory.
echo "The top 10 largest files in the /home directory are:
$(du -h /home | sort -n -r | head -n10)"
