This project was completed using a Raspberry Pi to install a DNS Server and Network Utility Tools for UPS monitoring. I am connecting the Pi to the UPS through USB. 

#Project Details 
- This project enables a Raspberry Pi to serve as a DNS server (using dnsmasq) and with NUT (Network Utility Tools), allows for the UPS to be monitored.
- First, dnsmasq was installed and configured. Reference: https://pimylifeup.com/raspberry-pi-dns-server/
- Second, NUT was installed and configured. Having a UPS connected to the Raspberry Pi while going through the configuration steps is a good idea, but not needed. Reference: https://github.com/wynandbooysen/wynandbooysen.github.io-src/blob/master/content/2016-04-23-raspberry-pi-ups-server-using-nut.md

#Project Goal 
- The aim of this project was to document the process of installing and configuring a DNS server and NUT so that I could call one bash script to automate the whole process. 
- This automation project allows anyone to use a Raspberry Pi as a DNS server and to monitor a UPS. The settings would have to be adjusted depending on the UPS, but refer to the reference linked above to walk you through the process. 

The file called "setup.sh" is a bash file that will be called to update, install, and configure the Raspberry Pi for DNS and NUT.  
