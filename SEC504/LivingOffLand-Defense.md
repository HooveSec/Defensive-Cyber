# LOLDEF

## Powershell 

### Processes
get-process "powersh*"
get-process 'powershell' | select-object *
get-process -computername sec504student
get-process 'lsass' | select-object -property id
get-process | select-object -property path,name,id | where-object -property name -eq explorer
get-process | select-object -property path,name,id | where-object -property path -like "*temp*"
get-process | select-object -property path,name,id | where-object -property id -eq 4516

get-ciminstance -class win32_process | select-object processid,processname,commandline,path,parentprocessid
get-ciminstance -class win32_process | where-object -property ParentProcessId -EQ 644


### Network Usage
get-nettcpconnection 
get-nettcpconnection -state Listen | select-object -property LocalAddress,LocalPort,OwningProcess
Get-nettcpconnection -remoteaddress 10.10.76.1 | select-object CreationTime,Localport,remoteaddress,remoteport,owningprocess,state 
get-nettcpconnection | select local*,remote*,@{name='process';Expression={ (get-process -id $_.OwningProcess).Processname}} | format-table

### Services
get-service
get-service yeet
get-ciminstance -classname win32_service | format-list name,caption,description,pathname

### Registry
gci 'HKLM:\Software\wow6432node\microsoft\currentversion\uninstall\' | select-object pschildname
get-itemproperty 'HKLM:\software\microsoft\windows\currentversion\run'

### Unusual Accounts
get-localuser
get-localuser | where-object { $_.Enabled -eq $TRUE }
get-localgroup
get-localgroupmember administrators

### schtasks
get-scheduledtask *avast* | select-object -property taskname
export-scheduledtask -taskname 'avastupdatre'
get-scheduledtaskinfo -taskname 'avastupadtre' | select-object lastruntime

### Unusual Log Entries
get-winevent -logname system | where-object -property id -eq 7045 | format-list -property timecreated,message

### Differential Analysis
$b = cat scheduledtask
$n = cat scheduledtask2 
compare-object $b $n 


### remediation
stop-process 4156
remove-item $env:temp\calcache.exe

stop-service dynamics
get-process dynamics | Stop-process 
rm C:\windows\dynamics.exe 
net user dynamics /delete
sc.exe delete dynamics
Unregister-ScheduledTask -TaskName "Microsoft eDynamics"

### TCPDUMP
tcpdump -i <interface>
tcpdump -i <interface> -w file 
### Replay packets from file 
tcpdump -r file -n 
### SHow ASCII
tcpdump -r file -n -A 

### BPF
tcpdump -r file 'host 8.8.8.8'
tcpdump -r file 'src host 8.8.8.8'
tcpdump -r file 'not src host 8.8.8.8'
tcpdump -r file 'icmp and (src host 8.8.8.8)'
tcpdump -r file 

tcpdump -nr falsimentis.pcap dst host 167.172.201.123 | cut -d ' ' -f 3 | cut -d '.' -f 1-4 | sort -u