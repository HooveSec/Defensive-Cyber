## SMBCLIENT
### List Shares
smbclient -L //192.168.1.1 -U yeet -m SMB2
### Connect to Shares 
smbclient //192.168.1.1/accounting$ -U yeet -m SMB2 
## rpcclient for samba
rpcclient -U yeet 192.168.1.1 
	enumdomusers
	enumlsgroups domain|builtin
	lsaenumsid
	lookupnames <name/sid>
	lookupsids <sid>
	srvinfo