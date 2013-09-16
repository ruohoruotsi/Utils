#!/bin/bash
#
# Script to setup & configure a source build environment for Android - Jelly Bean
#
# 1) Installs dependencies
# 2) Repo inits
#
#  Written by iroro - 2012-04-02 - original ICS 4.0.3 script for Ubuntu 11.04
#                     2013-01-25 - updated for Jelly Bean, 4.1.1 for Ubuntu 12.04



#####################################################################
echo -e "\n\nCreating ~/bin in home directory - if needed"
#####################################################################

if [ ! -d "$HOME/bin" ] ; then
mkdir ~/bin
fi

source ~/.profile # Ensure bin is in the path

#####################################################################
cd ~/
WORKING_DIR="android_source"

if [ $# -eq 1 ]; then
WORKING_DIR=$1
echo -e "\nCreating working directory - ~/$WORKING_DIR \n"
fi

# Create the working directory if it doesn't exist
if [ ! -d $WORKING_DIR ]; then
mkdir -p $WORKING_DIR
cd ~/$WORKING_DIR
fi

#####################################################################
echo -e "\n\nInstalling dependencies"
#####################################################################

sudo DEBIAN_FRONTEND=noninteractive sudo apt-get install git-core gnupg flex bison gperf build-essential \
zip curl libc6-dev libncurses5-dev:i386 x11proto-core-dev \
libx11-dev:i386 libreadline6-dev:i386 libgl1-mesa-glx:i386 \
libgl1-mesa-dev g++-multilib mingw32 openjdk-6-jdk tofrodos \
python-markdown libxml2-utils xsltproc zlib1g-dev:i386

sudo apt-get install gcc-4.4 g++-4.4 g++-4.4-multilib
sudo unlink /usr/bin/gcc
sudo ln -s /usr/bin/gcc-4.4 /usr/bin/gcc
sudo unlink /usr/bin/g++
sudo ln -s /usr/bin/g++-4.4 /usr/bin/g++

#####################################################################
#sudo add-apt-repository "deb http://archive.canonical.com/ lucid partner"
#sudo apt-get update
#sudo apt-get install sun-java6-jdk

#####################################################################
echo -e "\n\nInstalling JDK6 -- DO ONCE THEN COMMENT OUT"
#####################################################################

# io havoc note: the above stuff didn't work per source.android.com
# install JDK6 per http://blog.markloiseau.com/2012/07/how-to-compile-android-on-ubuntu-12-04/#more-1687
# run update-alternatives so your system uses the Sun JDK:
sudo update-alternatives --install /usr/bin/java java /usr/lib/jvm/jdk1.6.0_37/bin/java 1
sudo update-alternatives --install /usr/bin/javac javac /usr/lib/jvm/jdk1.6.0_37/bin/javac 1
sudo update-alternatives --install /usr/bin/javaws javaws /usr/lib/jvm/jdk1.6.0_37/bin/javaws 1
sudo update-alternatives --config java
sudo update-alternatives --config javac
sudo update-alternatives --config javaws

#####################################################################
# only do this ONCE
# echo -e "\n\nLinking libGL.so"
# sudo ln -s /usr/lib/i386-linux-gnu/mesa/libGL.so.1 /usr/lib/i386-linux-gnu/libGL.so



#####################################################################
echo -e "\nSetting up the repo \n"
#####################################################################

curl https://dl-ssl.google.com/dl/googlesource/git-repo/repo > ~/bin/repo
chmod a+x ~/bin/repo


#####################################################################
echo -e "\nEntering working directory $WORKING_DIR \n"
#####################################################################

cd ~/$WORKING_DIR
repo init -u https://android.googlesource.com/platform/manifest -b android-4.1.1_r1


#####################################################################
echo -e "\n\n Now ready to call $repo sync \n\n"
#####################################################################
