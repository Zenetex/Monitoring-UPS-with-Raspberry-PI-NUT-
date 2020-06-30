LocationName='20171-00'

# Update Packages
echo "Updating Raspberry Pi"
sudo apt update -y
sudo apt upgrade -y

# Install DNS Masq
echo "Installing DNS"
sudo apt install dnsmasq -y

# Copy the DNS Config File
echo "Configuring DNS"
sudo cp -fr dnsmasq.conf /etc/dnsmasq.conf

# Resstart DNS Server
echo "Restarting DNS"
sudo systemctl restart dnsmasq


echo "Installing NUT-CLIENT & NUT-SERVER"
sudo apt-get install nut nut-client nut-server -y

#The path to all NUT files on PI  --> /etc/nut/
echo "Configuring ups.conf"
sudo cp -fr ups.conf /etc/nut/ups.conf
sudo sed -i "s/PutUPSNameHere/$LocationName/g" /etc/nut/ups.conf


echo "Configuring upsd.conf"
sudo sed -i 's/# LISTEN 127.0.0.1 3493/LISTEN 127.0.0.1 3493/g' /etc/nut/upsd.conf


echo "Configuring upsd.users"
sudo cp -fr upsd.users /etc/nut/upsd.users
sudo sed -i "s/PutUPSNameHere/$LocationName/g" /etc/nut/upsd.users


echo "Configuring nut.conf"
sudo sed -i 's/MODE=none/MODE=standalone/g' /etc/nut/nut.conf


echo "Configuring upsmon.conf"
sudo cp -fr upsmon.conf /etc/nut/upsmon.conf
sudo sed -i "s/PutUPSNameHere/$LocationName/g" /etc/nut/upsmon.conf



echo "Testing UPS driver"
sudo upsdrvctl start

echo Starting NUT-server"
sudo service nut-server start

echo Starting NUT-client"
sudo service nut-client start
