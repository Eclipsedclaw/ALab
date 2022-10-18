#!/bin/bash

#packages installation
sudo apt install net-tools    #to use ifconfig
sudo apt install gparted    #install UI surface for disk management

#mount HDD, only need to run these when you have new hardwares
sudo apt install gparted    #install UI surface for disk management
sudo fdisk -l   #list all the hardware
sudo mkdir HDD
sudo mount /dev/sda1 /HDD   #mount hard disk to certain directory

#get a link of HDD to your home directory
sudo ln -s /HDD ~/

#install geant4
sudo mkdir geant4

#setup ssh
sudo iptables -t nat -A PREROUTING -p tcp -d 192.168.1.242 --dport 1412 -j DNAT --to-destination 192.168.1.242:1412       #port forwarding
