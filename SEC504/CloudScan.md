# Scanning the internet
# Need to masscan from an AWS EC3 Instance 

## Google
wget -qO- https://www.gstatic.com/ipranges/cloud.json | jq '.prefixes[] | .ipv4Prefix' -r

## AWS 
wget -qO- https://ipranges-amazonaws.com/ip-ranges.json | jq '.prefixes[] | .ip_prefix' -r 
### US East Only
wget -qO- https://ipranges-amazonaws.com/ip-ranges.json | jq '.prefixes[] | if .region =="us.east-1" then .ip_prefix else empty end' -r | sort -u > us.east-1-range.txt 
masscan -iL us-east-1-range.txt -oL us-east-1-range.masscan -p 443 --rate 100000
head -3 us-east-1-range.masscan 

###
awk '/open/ {print $4}' us-east-1-range.masscan > us-east-1-range.tlsopen
tls-scan --port=443 --cacert=/opt/tls-scan/ca-bundle.crt -o simcloud-tlsinfo.json < simcloud-targets.txt
jq '.ip + " " + .certificateChain[].subjectCN' < simcloud-tlsinfo.json

## Azure 
download them 
jq < ~/Downloads/ServiceTags_Public_*.json '.values | .[] | .properties.addressPrefixes | .[]' -r 

## Masscan
masscan 192.168.1.1/24 -p 22,25,80,443,3389
masscan -p 22,25,80,443,3389 --rate 10000 -oL simcloud.txt 10.200.0.0/16
masscan -p 443 --rate 10000 -oL simcloud.txt 10.200.0.0/16