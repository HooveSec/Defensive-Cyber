#!/bin/bash
sudo apt-get update
#terminator is a linux terminator emulator that allows multiple terminal interfaces 
sudo apt-get install terminator


#dependencies for github pulls
sudo apt install git
#linenum is a linux enumeration script
git clone https://github.com/rebootuser/LinEnum

sudo apt-get install -y netcat nmap tmux screen wireshark filezilla proxychains4 netcat traceroute curl 
sudo apt-get install -y tcpdump
sudo apt-get install -y vim
sudo apt-get install -y zenmap
sudo apt-get install -y nikto
sudo apt-get install -y john
sudo apt-get install -y tcpreplay
sudo apt-get install -y tshark
sudo apt-get install -y autopsy
sudo apt-get install -y python3

snap install drawio
snap install powershell --classic

git clone https://github.com/411Hall/JAWS
git clone https://github.com/frizb/Windows-Privilege-Escalation
git clone https://github.com/joshuaruppe/winprivesc
git clone https://github.com/Z3R0th-13/Enum
sudo apt-get install virt-manager -y 
sudo apt-get install jq -y 
git clone https://github.com/kellyjonbrazil/jc
git clone https://github.com/nsacyber/Windows-Secure-Host-Baseline
