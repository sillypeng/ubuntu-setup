#! /bin/bash
if [ "$EUID" -eq 0 ]
  then echo "Please do not run this script as root"
  exit
fi

# git
sudo apt update
sudo apt install -y git gitk terminator
​
# java
sudo add-apt-repository ppa:webupd8team/java
sudo apt update
sudo apt install -y oracle-java8-installer

# chrome
sudo apt install -y libxss1 libappindicator1 libindicator7
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -O /tmp/google-chrome.deb
sudo dpkg -i /tmp/google-chrome.deb

# atom
wget -q https://github.com/atom/atom/releases/latest -O /tmp/latest
wget -q $(awk -F '[<>]' '/href=".*atom-amd64.deb/ {match($0,"href=\"(.*.deb)\"",a); print "https://github.com/" a[1]} ' /tmp/latest) -O /tmp/atom-amd64.deb
dpkg -i /tmp/atom-amd64.deb

# spotify
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt update
sudo apt install spotify-client

# nodejs
curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash -
sudo apt-get install -y nodejs npm build-essential

# common
mkdir ~/worksapce
mkdir ~/programs
echo 'export PATH=$PATH:~/.local' >> ~/.bashrc
echo 'export EDITOR=gedit' >> ~/.bashrc

# distribution upgrade
sudo apt dist-upgrade
