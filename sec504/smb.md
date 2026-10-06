## SMBCLIENT
### List Shares
smbclient -L //192.168.1.1 -U yeet -m SMB2
### Connect to Shares 
smbclient //192.168.1.1/accounting$ -U yeet -m SMB2 
## rpcclient for samba
rpcclient -U yeet 192.168.1.1 
	enumdomusers
	enumalsgroups domain	
	lsaenumsid
	lookupnames sec504
	lookupnames administrators
	lookupsids S-1-5-21-2977773840-2930198165-1551093962-1000
	srvinfo
	queryuser 500
	
	
## SMB Security
Look at 4625 windows events 
Set password lockout alert to N+1 or n*2 With N=password lockout number(3)

### Find and Kill Sessions
net session
net session \\10.10.75.1 /del