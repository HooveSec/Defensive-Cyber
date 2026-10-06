#!/bin/bash
# ICMP ping sweep of a /24. Lab/recon helper for networks you are authorized to scan.
echo "enter network addresses first 3 octets: IE 192.168.1"
read -r net

for i in {1..254}; do
  (ping -c 1 "$net.$i" | grep "bytes from") &
done
wait

