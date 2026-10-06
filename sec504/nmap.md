## Traceroute
sudo nmap -sn --traceroute 216.239.191.182-200 -oA insseure-net
## Host Discovery
sudo nmap -sn 192.168.1.1-254
## NSE
nmap --script all
nmap -sC 
nmap --script-help "http*"

nmap --script-help "smb*"

##OPSEC
Use port 445 as spoofed port. For defenders look for port-protocol mismatch
--source-port 445
-g 445
arpscan if possible


header is only 2 bytes 

##  Compare baseline to updated
### Take Baseline
nmap 127.0.0.1 -oX baseline.xml 
### Take New
nmap 127.0.0.1 -oX newscan.xml 
### Compare
ndiff baseline.xml newscan.xml 