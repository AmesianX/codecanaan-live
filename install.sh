#!/bin/bash

wget https://dl.google.com/linux/direct/google-chrome-stable_current_i386.deb

sudo dpkg -i ./google-chrome*.deb
sudo apt-get -f install

rm ./google-chrome*.deb

sudo apt-get install xinit
sudo apt-get install ibus
sudo apt-get install ibus-chewing
sudo apt-get install lxterminal

sudo apt-get install build-essential
sudo apt-get install openjdk-7-jdk      # Java
sudo apt-get install gcc                # C
sudo apt-get install g++                # C++
sudo apt-get install gobjc              # Objctive-C
sudo apt-get install ruby               # Ruby
sudo apt-get install pyphon             # Python
sudo apt-get install perl               # Perl
sudo apt-get install php5-cli           # PHP
sudo apt-get install nasm               # Assembly Language
sudo apt-get install r-base             # R
sudo apt-get install plt-scheme         # PLT Scheme
sudo apt-get install racket             # Racket

# Geany is simple IDE for beginners
sudo apt-get install geany geany-plugins

# TODO: download and install ChezScheme for i386

# TODO: using nvm to install latest node.js

# TODO: using gvm to install latest gradle groovy


#sudo apt-get install python-software-properties
#sudo apt-get install software-properties-common

#sudo add-apt-repository ppa:chris-lea/node.js
#sudo apt-get update
#sudo apt-get install nodejs npm 


