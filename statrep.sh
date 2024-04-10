#!/bin/bash

figlet -f digital 'Welcome, User'
echo ' '
echo 'Here is a summary of your system stats.'
echo ' '
echo 'Your Operating System and version is:'
hostnamectl | grep System | awk -F: '{print$2}'
echo ' '
echo 'Your internal IP is:'
ifconfig | grep broadcast | awk '{print$2}'
echo 'Your default gateway is:'
route | grep UG | awk '{print $2}'
echo 'Your public IP is:'
IPX=$(curl -s ifconfig.co)
echo "$IPX"
echo ' '
echo 'Your storage details are as follows:'
df -H | grep -E 'File|sda'
echo ' '
echo 'Your 5 largest directories are:'
du ~ | sort -nr | head -5
echo ' '
RED='\033[0;31m'
CLR='\033[0m'
echo -e "CPU usage is displayed below. It is refreshed every 10 seconds. ${RED}PRESS CTRL+C TO END.${CLR}"
top -d 10

