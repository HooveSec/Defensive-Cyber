#Volatility

## Processes 
vol -q -f win10.0.22000.556.raw windows.pslist.PsList 
## Parent/Child Processes
vol -q -f win10.0.22000.556.raw windows.pstree.PsTree
## Network connections
vol -q -f win10.0.22000.556.raw windows.netscan.NetScan
## Process command line 
vol -q -f win10.0.22000.556.raw windows.cmdline.CmdLine

## Other modules
windows.dlllist.DllList - DLLs
windows.driverscan.DriverScan - Kernel Modules
windows.envars.Envars - Environmental Vars
windows.filescan.FileScan - Scan for Files 
windows.dumpfiles.DumpFiles - Carve Files 
windows.info.Info - Windows version info 
windows.hashdump.Hashdump - hashes 
windows.priviledges.Privs - privs by processes
windows.registry.hivelist.HiveList - registry hive offsets
windows.registry.printkey.PrintKey - access keys with --offset 
windows.registry.userassist.UserAssist - programs from start menu 
windows.registry.certificates.Certificates - trusted certs in windows cert store 
windows.svcscan.SvcScan - list service name,display name, and pid 