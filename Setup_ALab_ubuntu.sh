#!/bin/bash

#packages installation
sudo apt update
sudo apt upgrade
sudo apt-get update
sudo apt-get upgrade
sudo apt install net-tools    #to use ifconfig
sudo apt install gparted    #install UI surface for disk management
sudo apt install git
sudo apt install cmake
sudo apt-get install build-essential
sudo apt-get install libx11-dev
sudo apt-get install libxpm-dev
sudo apt-get install libxft-dev
sudo apt-get install -y libxext-dev
sudo snap install htop
sudo apt install screen
sudo apt  install cmake-curses-gui
sudo apt install neovim
sudo apt install libxerces-c-dev
sudo sudo apt install qtbase5-dev
sudo apt install libxmu-dev

#mount HDD, only need to run these when you have new hardwares
sudo apt install gparted    #install UI surface for disk management
sudo fdisk -l   #list all the hardware
sudo mkdir HDD
sudo mount /dev/sda1 /HDD   #mount hard disk to certain directory

#get a link of HDD to your home directory
sudo ln -s /HDD ~/

#setup ssh
sudo iptables -t nat -A PREROUTING -p tcp -d 192.168.1.242 --dport 1412 -j DNAT --to-destination 192.168.1.242:1412       #port forwarding

#install root
cd /opt
sudo mkdir root
cd root
sudo git clone --branch latest-stable --depth=1 https://github.com/root-project/root.git root_src
sudo mkdir root_build root_install && cd root_build
sudo cmake -DCMAKE_INSTALL_PREFIX=../root_install ../root_src # && check cmake configuration output for warnings or errors
sudo cmake --build . -- install -j4 # if you have 4 cores available for compilation
sudo source ../root_install/bin/thisroot.sh # or thisroot.{fish,csh}
echo 'export ROOTsh=/opt/root/root_install/bin/thisroot.sh' >>~/.bash_profile
echo 'if [ -f ~/.bash_profile ]; then' >>~/.bashrc
echo '    . ~/.bash_profile' >>~/.bashrc
echo 'fi' >>~/.bashrc
source ~/.bashrc
source ~/.bash_profile

#install geant4 for GAPS, if you just want to run your own geant4 project, there is no need for extra patches.
cd /opt
sudo mkdir geant4
cd geant4
sudo wget https://github.com/Geant4/geant4/archive/refs/tags/v11.0.3.zip    #This link is related to geant4 source files, please adjust this respect to the newest version
sudo unzip v11.0.3.zip
sudo mkdir geant4-11.0.3-build
sudo mkdir geant4-11.0.3-install
cd geant4-11.0.3-build/
sudo make -j12    #number after j is the core number for your cpu, if you have 8 cores, then please adjust this to -j8
sudo make install
echo 'export Geant4sh=/opt/root/geant4-11.0.3-install/bin/geant4.sh' >>~/.bash_profile
source ~/.bash_profile

#install SimpleDet
cd /opt
sudo mkdir boost
cd boost
sudo https://boostorg.jfrog.io/artifactory/main/release/1.68.0/source/boost_1_68_0.tar.gz
sudo tar -xf boost_1_68_0.tar.gz
cd boost_1_68_0/
./bootstrap.sh 
./b2
git clone -b develop https://UbuntuServer@uhhepvcs.phys.hawaii.edu/philipvd/SimpleDet.git SimpleDet   #password will be the token you have
mkdir build
cd build
