#!/bin/bash
# Bootstrap a Linux analysis workstation. Run on a machine you administer.
set -euo pipefail

sudo apt-get update
sudo apt-get install -y \
  autopsy \
  curl \
  filezilla \
  git \
  john \
  jq \
  netcat \
  nmap \
  proxychains4 \
  python3 \
  screen \
  tcpdump \
  tcpreplay \
  terminator \
  tmux \
  traceroute \
  tshark \
  vim \
  virt-manager \
  wireshark \
  zenmap \
  nikto

sudo snap install drawio
sudo snap install powershell --classic

# Host enumeration / baseline helpers
git clone https://github.com/rebootuser/LinEnum
git clone https://github.com/411Hall/JAWS
git clone https://github.com/Z3R0th-13/Enum
git clone https://github.com/kellyjonbrazil/jc
git clone https://github.com/nsacyber/Windows-Secure-Host-Baseline
git clone https://github.com/frizb/Windows-Privilege-Escalation
git clone https://github.com/joshuaruppe/winprivesc

