#!/bin/sh
###############################################################################
echo ">>>>>>>>>> Starting BryFlix install script..."
sudo apt-get update
sudo apt-get upgrade -y 

echo ">>>>>>>>>> Installing base packages..."
sudo apt-get install -y unionfs-fuse python3-pip git encfs unzip htop nload
sudo -H pip3 install --upgrade pip
sudo -H pip install --upgrade youtube-dl
sudo -H pip3 install --upgrade acdcli

echo ">>>>>>>>>> Creating directories..."
mkdir ~/.local-encrypt ~/.local-decrypt ~/media ~/.acd-encrypt ~/.acd-decrypt ~/logs ~/bin

echo ">>>>>>>>>> Setting permissions and moving files..."
sudo chown metalgeek *
sudo chmod 645 fuse.conf
chmod 775 mount.acd upload.acd
cp .encfs6.xml ~/
cp mount.acd ~/bin
sudo cp fuse.conf /etc 

echo ">>>>>>>>>>> Setup ACD_CLI..."
acd_cli sync
