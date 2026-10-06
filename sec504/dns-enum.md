# DNS 
## Zone Query
dig @172.30.0.254 A falsimentis.com +short
dig @172.30.0.254 MX falsimentis.com +short
## Manual Bruteforce
dig @172.30.0.254 A admin.falsimentis.com +short
dig @172.30.0.254 A login.falsimentis.com +short
dig @172.30.0.254 A backup.falsimentis.com +short
dig @172.30.0.254 A ns.falsimentis.com +short
dig @172.30.0.254 A share.falsimentis.com +short
dig @172.30.0.254 A support.falsimentis.com +short




## Zone Transfer Request
dig @172.30.0.254 AXFR falsimentis.com +short

## NMAP Automation
sudo nmap --dns-servers 172.30.0.254 --script dns-brute --script-args dns-brute.domain=falsimentis.com -Pn
sudo nmap --dns-servers 172.30.0.254 --script dns-brute --script-args dns-brute.domain=falsimentis.com,dns-brute.hostlist=/home/sec504/labs/dns/namelist.txt