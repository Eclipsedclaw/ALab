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
sudo apt install jupyter-core   #install jupyter-lab
sudo apt install python3-pip
sudo pip install jupyterlab
sudo apt-get install libprotobuf-dev protobuf-compiler
sudo apt install openjdk-8-jdk    #install java 8
sudo apt install libmysqlclient-dev   #install mysql
sudo apt-get install -y libsqlite3-dev    #install sqlite
sudo apt install r-cran-rcpp    #install Rcpp
sudo apt-get install -y r-cran-rinside    #install RInside

#mount HDD, only need to run these when you have new hardwares
sudo apt install gparted    #install UI surface for disk management
sudo fdisk -l   #list all the hardware
sudo mkdir HDD
sudo mount /dev/sda1 /HDD   #mount hard disk to certain directory

#get a link of HDD to your home directory
sudo ln -s /HDD ~/

#setup ssh
#check router port forwarding and modify /etc/ssh/sshd_config to a certain port

#set up tigerVNC:https://www.cyberciti.biz/faq/install-and-configure-tigervnc-server-on-ubuntu-18-04/
sudo apt install tigervnc-standalone-server tigervnc-xorg-extension tigervnc-viewer   #install libraries
sudo apt install ubuntu-gnome-desktop   #install desktop environment
sudo systemctl enable gdm
sudo systemctl start gdm
vim ~/.vnc/xstartup
echo '#!/bin/sh' >> ~/.vnc/xstartup
echo '# Start Gnome 3 Desktop' >> ~/.vnc/xstartup
echo '[ -x /etc/vnc/xstartup ] && exec /etc/vnc/xstartup' >> ~/.vnc/xstartup
echo '[ -r $HOME/.Xresources ] && xrdb $HOME/.Xresources' >> ~/.vnc/xstartup
echo 'vncconfig -iconic &' >> ~/.vnc/xstartup
echo 'dbus-launch --exit-with-session gnome-session' >> ~/.vnc/xstartup
#For detailed tigerVNC setup please check this repository under remote_setup: https://github.com/Eclipsedclaw/ALab/tree/main/remote_setup

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

#install HepRApp for geant4 visulization
cd /opt
sudo mkdir HepRApp
cd HepRApp
sudo wget http://www.slac.stanford.edu/~perl/HepRApp/HepRApp.jar
echo 'alias HepRApp="java -jar /opt/HepRApp/HepRApp.jar"' >> ~/.bashrc
source ~/.bashrc

#install SimpleDet, seems need root 62600.
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

#install GramsSim
#install dependency Xerces-C
cd /opt
sudo mkdir Xerces-C
cd Xerces-C
sudo git clone https://gitbox.apache.org/repos/asf/xerces-c.git
sudo mkdir build
sudo mkdir xerces-c-install
cd build
sudo cmake -G "Unix Makefiles" -DCMAKE_INSTALL_PREFIX=/opt/Xerces-C/xerces-c-install -DCMAKE_BUILD_TYPE=Debug -Dmessage-loader=icu ../xerces-c/
sudo make -j11
sudo make test
sudo make install
#install dependency HepMC3
cd /opt
sudo mkdir HepMC3
cd HepMC3/
sudo git clone https://gitlab.cern.ch/hepmc/HepMC3.git
sudo mkdir hepmc3-build
cd hepmc3-build
sudo cmake -DHEPMC3_ENABLE_ROOTIO=OFF -DCMAKE_INSTALL_PREFIX=../hepmc3-install ../HepMC3
sudo make -j11
sudo make install
#install dependency CFITSIO
cd /opt
sudo mkdir CFITSIO
cd CFITSIO/
sudo wget http://heasarc.gsfc.nasa.gov/FTP/software/fitsio/c/cfitsio-4.1.0.tar.gz
sudo tar -xvzf cfitsio-4.1.0.tar.gz 
sudo mkdir build
cd build/
sudo cmake ../cfitsio-4.1.0/
sudo make -j11
sudo make install
#install dependency HEALPix
cd /opt
sudo mkdir HEALPix
cd HEALPix
sudo wget https://cfhcable.dl.sourceforge.net/project/healpix/Healpix_3.82/Healpix_3.82_2022Jul28.tar.gz
sudo tar -xvzf Healpix_3.82_2022Jul28.tar.gz 
sudo ./configure --auto=cxx   #not sure if this is proper
