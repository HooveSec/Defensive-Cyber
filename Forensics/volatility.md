## Basic info for windows 
		python3 vol.py -f workstation.vmem windows.info

## Process info
	python3 vol.py -f workstation.vmem windows.pslist
	python3 vol.py -f workstation.vmem windows.psscan
	python3 vol.py -f workstation.vmem windows.pstree
	python3 vol.py -f workstation.vmem windows.netstat.NetStat


## Individual file forensics
### Dump contents of binary
	python3 vol.py -f workstation.vmem windows.dumpfiles --pid 2406