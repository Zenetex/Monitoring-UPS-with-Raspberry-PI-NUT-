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
#Changing code for DNS configuration
sudo cp -fr dnsmasq.conf /etc/dnsmasq.conf

# Resstart DNS Server
echo "Restarting DNS"
sudo systemctl restart dnsmasq


echo "Installing NUT-CLIENT & NUT-SERVER"
sudo apt-get install nut nut-client nut-server -y

#The path to all NUT files on PI  --> /etc/nut/
echo "Configuring ups.conf"
#Inputting the code for UPS
sudo cp -fr ups.conf /etc/nut/ups.conf


echo "Configuring upsd.conf"
sudo sed -i 's/# LISTEN 127.0.0.1 3493/LISTEN 127.0.0.1 3493/g' /etc/nut/upsd.conf


echo "Configuring upsd.users"
#inputting the code to manage users
sudo cp -fr upsd.users /etc/nut/upsd.users

echo "Configuring nut.conf"
sudo sed -i 's/MODE=none/MODE=standalone/g' /etc/nut/nut.conf


echo "Configuring upsmon.conf"
#Inputting the code for UPS monitoring
sudo cp -fr upsmon.conf /etc/nut/upsmon.conf

#???
#echo "Creating script to send curl command"
#curl  --request POST 'https://prod-28.eastus2.logic.azure.com:443/workflows/42517d4652c9446d8808fe0665c76088/triggers/request/paths/invoke?api-version=2016-10-01&sp=%2Ftriggers%2Frequest%2Frun&sv=1.0&sig=oqY1WrPZX1_xK23Tj0h4lthuYT0vltjyW8QyRmou_GU' --header 'Content-Type: application/json' --data-raw '{ "location": "20171-00" }'


#NOTE = PutUPSNameHere

sudo sed -i "s/PutUPSNameHere/$LocationName/g" /etc/nut/ups.conf
sudo sed -i "s/PutUPSNameHere/$LocationName/g" /etc/nut/upsd.users
sudo sed -i "s/PutUPSNameHere/$LocationName/g" /etc/nut/upsmon.conf

echo "Testing UPS driver"
sudo upsdrvctl start

echo Starting NUT-server"
sudo service nut-server start

echo Starting NUT-client"
sudo service nut-client start
