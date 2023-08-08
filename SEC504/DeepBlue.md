# DeepblueCLI
## Locally
DeepBlue.ps1

## Sppecific Log 
DeepBlue.ps1 Logfile.evtx 

## Specific logs locally 
DeepBlue.ps1 -Log System 

## Remote with creds
$credential = get-credential
DeepBlue.ps1 -Log System -Hostname DC1 -Credential $credential

## Formatting
.\DeepBlue.ps1 Security.evtx | Format-List -Properety Message, results

.\DeepBlue.ps1 Security.evtx | Export-csv -path Report.csv 