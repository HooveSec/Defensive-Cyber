# General Forensics

## VMs you can use
	https://github.com/mandiant/flare-vm
	https://cuckoosandbox.org/
	https://docs.remnux.org/
	
	
## See if it is packed 
	detect it easy - https://github.com/horsicq/Detect-It-Easy

## Unpack with upx
	upx -d yeet.exe
	
## Network Information
	FakeDNS
	NetworkMiner

## Static analysis
	strings file
	floss -n 6 file
	floss -n 6 | grep http://