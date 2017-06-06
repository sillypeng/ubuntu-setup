#! /bin/bash
if [ "$EUID" -eq 0 ]
  then echo "Please do not run this script as root"
  exit
fi

# basic
sudo apt update
sudo apt install -y build-essential libssl-dev git gitk terminator mc numlockx
​
# java
sudo add-apt-repository ppa:webupd8team/java
sudo apt update
sudo apt install -y oracle-java8-installer

# chrome
sudo apt install -y libxss1 libappindicator1 libindicator7
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -O /tmp/google-chrome.deb
sudo dpkg -i /tmp/google-chrome.deb

# spotify
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt update
sudo apt install spotify-client

# nodejs
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.2/install.sh | bash

# common
mkdir ~/worksapce
mkdir ~/programs
echo 'export PATH=$PATH:~/.local' >> ~/.bashrc
echo 'export EDITOR=gedit' >> ~/.bashrc

# i3wm
/usr/lib/apt/apt-helper download-file http://debian.sur5r.net/i3/pool/main/s/sur5r-keyring/sur5r-keyring_2017.01.02_all.deb keyring.deb SHA256:4c3c6685b1181d83efe3a479c5ae38a2a44e23add55e16a328b8c8560bf05e5f
sudo apt install -y ./keyring.deb
sudo echo "deb http://debian.sur5r.net/i3/ $(grep '^DISTRIB_CODENAME=' /etc/lsb-release | cut -f2 -d=) universe" >> /etc/apt/sources.list.d/sur5r-i3.list
sudo apt update
sudo apt install -y i3
rm ./keyring.deb

# distribution upgrade
sudo apt dist-upgrade
