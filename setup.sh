#!/bin/bash
LocationName='20171-00'
# Update Packages
echo ""
echo "****Updating Raspberry Pi****"
sudo apt update # && sudo apt-get -y upgrade
echo ""
# Install DNS Masq
echo "****Installing DNS****"
sudo apt-get -y install dnsmasq
echo ""
# Copy the DNS Config File
echo "****Configuring DNS****"
sudo cp -fr dnsmasq.conf /etc/dnsmasq.conf
echo ""
# Resstart DNS Server
echo "****Restarting DNS****"
sudo systemctl restart dnsmasq
echo ""
echo "****Installing NUT-CLIENT & NUT-SERVER****"
sudo apt-get -y install nut nut-client nut-server
echo ""
#The path to all NUT files on PI  --> /etc/nut/
echo "****Configuring ups.conf****"
sudo cp -fr ups.conf /etc/nut/ups.conf
sudo sed -i "s/PutUPSNameHere/$LocationName/g" /etc/nut/ups.conf
echo ""
echo "****Configuring upsd.conf****"
sudo sed -i 's/# LISTEN 127.0.0.1 3493/LISTEN 127.0.0.1 3493/g' /etc/nut/upsd.conf
echo ""
echo "****Configuring upsd.users****"
sudo cp -fr upsd.users /etc/nut/upsd.users
sudo sed -i "s/PutUPSNameHere/$LocationName/g" /etc/nut/upsd.users
echo ""
echo "****Configuring nut.conf****"
sudo sed -i 's/MODE=none/MODE=standalone/g' /etc/nut/nut.conf
echo ""
echo "****Configuring upsmon.conf****"
sudo cp -fr upsmon.conf /etc/nut/upsmon.conf
sudo sed -i "s/PutUPSNameHere/$LocationName/g" /etc/nut/upsmon.conf
echo ""
echo "****Testing UPS driver****"
sudo upsdrvctl start
echo ""
echo "****Starting NUT-server****"
sudo service nut-server start
echo "****Starting NUT-client****"
sudo service nut-client start
