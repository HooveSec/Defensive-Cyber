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

### Example Investigation 
vol -q -f FM-TETRIS.mem windows.netscan.NetScan > fm-tetris.windows.netscan.NetScan.txt
vol -q -f FM-TETRIS.mem windows.pstree.PsTree > fm-tetris.windows.pstree.PsTree.txt
vol -q -f FM-TETRIS.mem windows.pslist.PsList > fm-tetris.windows.pslist.PsList.txt
vol -q -f FM-TETRIS.mem windows.cmdline.CmdLine > fm-tetris.windows.cmdline.CmdLine.txt
vol -q -f FM-TETRIS.mem windows.filescan.FileScan > fm-tetris.windows.filescan.FileScan.txt
vol -q -f FM-TETRIS.mem windows.dlllist.DllList > fm-tetris.windows.dlllist.DllList.txt
strings FM-TETRIS.mem > fm-tetris.strings-asc.txt
strings -e l FM-TETRIS.mem > fm-tetris.strings-unile.txt
strings -e b FM-TETRIS.mem > fm-tetris.strings-unibe.txt
vol -q -f FM-TETRIS.mem windows.info.Info

grep -i -h bJKRJiSAnPkf fm-tetris.strings-*.txt | sort -u