param( [string]$computerName )

Write-Host $computerName -ForegroundColor Yellow

New-PSSession -ComputerName Domain-Controll

Invoke-Command -ComputerName $computerName -ScriptBlock {
  New-PSDrive HostData -PSProvider FileSystem -Root "\\Sql2014\HostData" 

$logDirectory= "HostData:\$computerName"

#This script has already been run.
if( Test-Path $logDirectory) { return }

# New-Item "$logDirectory" -ItemType "directory" -Force 
New-Item "$logDirectory/Logs" -ItemType "directory" -Force 


# Copy Event Logs
try {
  # New-Item "$logDirectory/Logs" -ItemType "directory" -Force 
    Get-WmiObject Win32_NTEventlogFile | Select-Object Name, LogfileName | % {
      $logLocation = $_.Name
      $logName     = $_.LogfileName
      Copy-Item -Path $logLocation -Destination "$logDirectory/Logs/$logName.evtx" -Force
    }
  # Pop-Location
} catch {
  Write-Host "ERROR: Copying Logs..." -ForegroundColor Red
}
# /Copy Log Files

# SMB
try {
  Get-SmbShare |
    Select-Object * |
    Export-CSV -NoTypeInformation -Path "$logDirectory/shares.csv" -Force

  # Named Pipes
  try {
    get-childitem \\.\pipe\ |
      Out-File "$logDirectory/NamedPipes.txt"
  } catch {
    [System.IO.Directory]::GetFiles( "\\.\\pipe\\" ) |
      Out-File "$logDirectory/NamedPipes.txt"
  }
} catch {
  Write-Host "ERROR: SMB Enumeration..." -ForegroundColor Red
}
# /SMB

# System Info
try {
  <#$hostInfo = $( Get-CimInstance -ClassName Win32_ComputerSystem )
  $hostInfo += "`r`n"
  $hostInfo += $( Get-CimInstance -ClassName Win32_OperatingSystem |
                    Select-Object -Property * )
  $hostInfo += "`r`n" 
  $hostInfo += $( Get-CimInstance -ClassName Win32_Processor |
                    Select-Object -ExcludeProperty "CIM*" )
  $hostInfo | Out-File "$logDirectory/hostinfo.txt"
  #>
  
  ipconfig /all                 | Out-File "$logDirectory/ipconfig.txt"
  ipconfig /displaydns          | Out-File "$logDirectory/dnscache.txt"
  netstat -anob | Out-File "$logDirectory/netstat.txt"
  arp -a                        | Out-File "$logDirectory/arp.txt"

  net users                     | Out-File "$logDirectory/netusers.txt"
  net localgroup administrators | Out-File "$logDirectory/administrators.txt"

  tasklist -v | Out-File "$logDirectory/tasklist.txt"
  schtasks /query /fo LIST /v   | Out-File "$logDirectory/schedtasks.txt"

  #Get-MpPreference | Select Exclusion* Out-File "$logDirectory/defenderExclude.txt"
  #Get-MpPreference | Select *DefaultAction Out-File "$logDirectory/defenderAction.txt"

  auditpol /get /category:* | Out-File "$logDirectory/auditpol.txt"
  #auditpol /set /subcategory:"Process Creation" /success:enable /failure:enable

  Get-WinEvent -FilterHashtable @{
    LogName = 'Microsoft-Windows-Bits-Client/Operational';
    Id = '59' } |
      Export-CSV -NoTypeInformation "$logDirectory/bitsjobs.csv" -Force

  Get-WinEvent -Log 'Microsoft-Windows-TerminalServices-LocalSessionManager/Operational' |
    Select-Object -exp Properties      |
    where { $_.Value -like '*.*.*.*' } |
    Sort-Object Value -u               |
      Export-CSV -NoTypeInformation "$logDirectory/rdpConnectionHistory.csv" -Force

  Get-CimInstance Win32_StartupCommand | Select-Object Name, command, Location, User |
    Export-CSV -NoTypeInformation "$logDirectory/startupCommands.csv" -Force 

  Get-ChildItem -path C:\Windows\System32\drivers -include *.sys -recurse -ea SilentlyContinue | Get-AuthenticodeSignature | where { $_.status -ne 'Valid' } |
    Out-File "$logDirectory/invalidDrivers.txt"

  wmic useraccount list | Out-File "$logDirectory/useraccount.txt"
  <#
  wmic sysaccount       | Out-File "$logDirectory/sysaccount.txt"
  wmic netlogin list /format:csv |
    Export-CSV -NoTypeInformation "$logDirectory/netlogin.csv" -Force
  #>

  <#Get-WMIObject -class win32_quickfixengineering |
  Export-CSV -NoTypeInformation "$logDirectory/patches.csv" -Force
  #>

  <#
  wmic /node:localhost product list full /format:csv |
    Export-CSV -NoTypeInformation "$logDirectory/productlist.csv" -Force
  wmic softwarefeature get name,version /format:csv |
    Export-CSV -NoTypeInformation "$logDirectory/softwarefeature.csv" -Force
  wmic softwareelement get name,version /format:csv |
    Export-CSV -NoTypeInformation "$logDirectory/softwareelement.csv" -Force
  #>
  } catch {
  Write-Host "ERROR: Basic Enumeration..." -ForegroundColor Red
}
# /System Info


# /Dump Registry
try {
  # Boot or Logon Autostart
  # Resources: https://attack.mitre.org/techniques/T1547/001/
  @( 'HKLM', 'HKU' ) | %  {
    reg export $_ "$logDirectory/$_.reg"
  }
} catch {
  Write-Host "ERROR: Dumping Registry..." -ForegroundColor Red
}
# /Dump Registry
#>

# Detailed Process Info
<# 
try {
  Get-WmiObject -Namespace root\cimv2 -Class CIM_ProcessExecutable | % {
    [wmi]"$($_.Antecedent)" | ? {
      $_.Manufacturer -ne 'Microsoft Corporation'
    } | Select-Object FileName,    Extension,    `
                      InstallDate, Manufacturer, `
                      Version,     Name,         `
                      System
} | Export-CSV -NoTypeInformation -Path "$logDirectory/processesDetail.csv" -Force
} catch {
  Write-Host "ERROR: Detailed Process Information..." -ForegroundColor Red
}
#>

# /Detailed Process Info

<#
try {
  # Get Files modified within a certain time frame.
  #$modfiles = ""
  Get-ChildItem -Path C:\ -Depth 4 -Recurse | %  {
    if( $_.CreationTime -gt '8/15/20' -AND $_.CreationTime -lt '9/1/20' ) {
      $modfiles += Get-ItemProperty -Path $_.FullName |
        Format-list -Property * -Force |
        Add-Content "./$computerName/modFiles.txt"
        #$modfiles += "`r`n"
    }
  }
  #$modfiles | Out-File "./$computerName/modFiles.txt"
} catch {
  Write-Host "ERROR: Timeline Collection Failed..." -ForegroundColor Red
}
#>

Remove-PSDrive HostData

}
