# Insatllation guid
This file gives information of all the softwares and packages that has to be installed as **Pre-requisites**
 

Python Versions and Packages used
-
* pip 9.0.1
* numpy 1.16.4
* tensorflow 1.14.0
* cv2 4.1.1

Linux Dev Environment Setup
-
```bash
#Ubuntu 18.04.2 Desktop Setup

sudo apt-get update
sudo apt-get upgrade
sudo apt-get install build-essential linux-headers-$[uname]

# guest additions installation (to enable copy-paste with host)
sudo apt-get install virtualbox-guest-additions-iso
# mount installed disc in /usr/share/virtualbox/VBoxGuestAdditions.iso
# Go to the mounted disc folder and 'run software'
# enable bidirectional clipboard and drag'n'drop with host in settings
reboot

# Anaconda Installation
wget  https://repo.anaconda.com/archive/Anaconda3-2019.07-Linux-x86_64.sh
sudo bash Anaconda3-2019.07-Linux-x86_64.sh
reboot
# create conda environment
conda create --name tensorflow

# Pip and Tensorflow Installation
conda activate tensorflow
sudo apt install python-pip
sudo apt install python3-pip
pip3 install numpy==1.16.4
pip3 install tensorflow==1.14.0
reboot

# install the cmake gui tool
sudo apt  install cmake-qt-gui

# opencv installation
# full instructions can be found on https://docs.opencv.org/master/d7/d9f/tutorial_linux_install.html
sudo apt-get install build-essential
sudo apt-get install cmake git libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev
cd Downloads
# install latest opencv from https://opencv.org/releases/
# unzip folder and move to it
cd opencv-4.1.1
mkdir build
cd build
cmake-gui
	- pass source file (e.g. ~/Downloads/opencv-4.1.1)
	- pass build file (e.g. ~/Downloads/opencv-4.1.1/build)
	- 'Configure'
	- 'Generate'
make -j7
sudo make install

# test installations
python3
	- import tensorflow
	- import cv2


```
