#!/bin/bash

#This shell script using for unlock the apt function

#Kill all the apt-get process
sudo killall apt apt-get

#Remove the lock
sudo rm /var/lib/apt/lists/lock
sudo rm /var/cache/apt/archives/lock
sudo rm /var/lib/dpkg/lock*

#Reconfigure the package information
sudo dpkg --configure -a

#Finally, execute the apt update
sudo apt update
