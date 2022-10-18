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

#install geant4

#install root
cd /opt
mkdir root
cd root
git clone --branch latest-stable --depth=1 https://github.com/root-project/root.git root_src
mkdir root_build root_install && cd root_build
cmake -DCMAKE_INSTALL_PREFIX=../root_install ../root_src # && check cmake configuration output for warnings or errors
cmake --build . -- install -j4 # if you have 4 cores available for compilation
source ../root_install/bin/thisroot.sh # or thisroot.{fish,csh}
