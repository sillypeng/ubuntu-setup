#! /bin/bash
if [ "$EUID" -eq 0 ]
  then echo "Please do not run this script as root"
  exit
fi

# basic
sudo apt update
sudo apt install -y build-essential libssl-dev git gitk mc numlockx rofi i3blocks


# chrome
sudo apt install -y libxss1 libappindicator1 libindicator7
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -O /tmp/google-chrome.deb
sudo dpkg -i /tmp/google-chrome.deb

# nodejs
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash

# common
mkdir ~/worksapce
mkdir ~/programs
echo 'export PATH=$PATH:~/.local' >> ~/.bashrc
echo 'export EDITOR=gedit' >> ~/.bashrc

# distribution upgrade
sudo apt dist-upgrade
