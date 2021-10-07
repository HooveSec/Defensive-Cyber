port=0
success=0

if [ $# -lt 1]; then 
  echo "Please provide port number"
  echo "e.g $0 22"
  exit 1
fi

echo "Grepping for port ($1)"

for i in `ls /proc`; do

  proto=""
  pfiles $i 2> /dev/null | /usr/xpg4/bin/grep -q -e "port: $1"
  
  if [ $? -eq 0]; then 
    port_found=1
    
    pfiles $i | tr '\n' ';' | /usr/xpg4/bin/grep -q -e "SOCK_DGRAM.*;.*port: $1"
      if [ $? -eq 0]; then 
        proto="UDP"
      fi
      
      pfiles $i | tr '\n' ';' | /usr/xpg4/bin/grep -q -e "SOCK_STREAM.*;.*port: $1"
      if [ $? -eq 0]; then 
        proto="TCP"
      fi
      
      if [ $proto == "" ]; then
        proto="(TCP, UDP, or something else)"
      fi
  fi
  
  if [ $port -eq 1 ]; then
    echo "Port $1 $proto is being used by pid $i"
    port=0
    success=1
  fi
done

