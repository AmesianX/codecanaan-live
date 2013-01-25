#!/bin/bash

mount -t proc none /proc/
mount -t sysfs none /sys/
export HOME=/root

locale-gen zh_TW.UTF-8
update-locale LANG=zh_TW.UTF-8



sudo apt-get update

sudo apt-get --yes install fontconfig fontconfig-config libasound2 libatk1.0-0 libatk1.0-data libavahi-client3 libavahi-common-data libavahi-common3 libcairo2 libcups2 libdatrie1 libdrm-nouveau2 libfm-data libfm-gtk-bin libfm-gtk-data libfm-gtk3 libfm3 libfontconfig1 libfontenc1 libgdk-pixbuf2.0-0 libgdk-pixbuf2.0-common libgee2 libgif4 libgtk2.0-0 libgtk2.0-common libice6 libid3tag0 libimlib2 libiw30 libjasper1 libjbig0 libjpeg-turbo8 libjpeg8 libllvm3.1 libmenu-cache1 libmtdev1 libobrender27 libobt0 libpango1.0-0 libpixman-1-0 libpolkit-agent-1-0 libsm6 libstartup-notification0 libthai-data libthai0 libtiff5 libwnck-common libwnck22 libx11-xcb1 libxatracker1 libxaw7 libxcb-dri2-0 libxcb-render0 libxcb-shm0 libxcb-util0 libxcomposite1 libxcursor1 libxdamage1 libxfixes3 libxfont1 libxft2 libxi6 libxinerama1 libxkbfile1 libxml2 libxmu6 libxpm4 libxrandr2 libxrender1 libxres1 libxt6 libxv1 libxvmc1 lxde-common lxde-core lxmenu-data lxpanel lxsession lxsession-data openbox pcmanfm shared-mime-info ttf-dejavu-core x11-common x11-xkb-utils xserver-common xserver-xorg xserver-xorg-core xserver-xorg-input-all xserver-xorg-input-evdev xserver-xorg-input-mouse xserver-xorg-input-synaptics xserver-xorg-input-vmmouse xserver-xorg-input-wacom xserver-xorg-video-all xserver-xorg-video-ati xserver-xorg-video-cirrus xserver-xorg-video-fbdev xserver-xorg-video-intel xserver-xorg-video-mach64 xserver-xorg-video-mga xserver-xorg-video-modesetting xserver-xorg-video-neomagic xserver-xorg-video-nouveau xserver-xorg-video-openchrome xserver-xorg-video-qxl xserver-xorg-video-r128 xserver-xorg-video-radeon xserver-xorg-video-s3 xserver-xorg-video-savage xserver-xorg-video-siliconmotion xserver-xorg-video-sis xserver-xorg-video-sisusb xserver-xorg-video-tdfx xserver-xorg-video-trident xserver-xorg-video-vesa xserver-xorg-video-vmware

sudo apt-get --yes install language-support-zh language-pack-gnome-zh* ttf-arphic-*

wget https://dl.google.com/linux/direct/google-chrome-stable_current_i386.deb

sudo dpkg -i ./google-chrome*.deb
sudo apt-get --yes -f install

rm google-chrome-stable_current_i386.deb

sudo apt-get --yes install Leafpad
sudo apt-get --yes install xinit
sudo apt-get --yes install ibus
sudo apt-get --yes install ibus-chewing
sudo apt-get --yes install lxterminal
sudo apt-get --yes install ttf-arphic-uming

sudo apt-get --yes install build-essential
sudo apt-get --yes install openjdk-7-jdk      # Java
sudo apt-get --yes install gcc                # C
sudo apt-get --yes install g++                # C++
sudo apt-get --yes install gobjc              # Objctive-C
sudo apt-get --yes install ruby               # Ruby
sudo apt-get --yes install pyphon             # Python
sudo apt-get --yes install perl               # Perl
sudo apt-get --yes install php5-cli           # PHP
sudo apt-get --yes install nasm               # Assembly Language
sudo apt-get --yes install r-base             # R
sudo apt-get --yes install plt-scheme         # PLT Scheme
sudo apt-get --yes install racket             # Racket


wget -nc http://www.scheme.com/download/PetiteChezScheme-8.4-1.i386.rpm
sudo apt-get --yes install alien
alien PetiteChezScheme-8.4-1.i386.rpm
sudo dpkg -i petitechezscheme_8.4-2_i386.deb

rm PetiteChezScheme-8.4-1.i386.rpm
rm petitechezscheme_8.4-2_i386.deb




sudo apt-get --yes purge alien

sudo apt-get --yes purge xscreensaver




# Geany is simple IDE for beginners
# sudo apt-get --yes install geany geany-plugins

# TODO: download and install ChezScheme for i386

# TODO: using nvm to install latest node.js

# TODO: using gvm to install latest gradle groovy


#sudo apt-get install python-software-properties
#sudo apt-get install software-properties-common

#sudo add-apt-repository ppa:chris-lea/node.js
#sudo apt-get update
#sudo apt-get install nodejs npm 


apt-get --yes autoremove
apt-get clean
rm -rf /tmp/*
rm -f /etc/hosts /etc/resolv.conf
umount /proc/
umount /sys/
exit



