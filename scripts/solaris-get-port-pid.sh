#!/bin/bash
# Map a TCP/UDP port to a PID on Solaris using pfiles.

if [ $# -lt 1 ]; then
  echo "Please provide port number"
  echo "e.g. $0 22"
  exit 1
fi

echo "Grepping for port ($1)"

success=0

for i in /proc/*; do
  pid="${i##*/}"
  case "$pid" in
    *[!0-9]*) continue ;;
  esac

  proto=""
  if pfiles "$pid" 2>/dev/null | /usr/xpg4/bin/grep -q -e "port: $1"; then
    if pfiles "$pid" | tr '\n' ';' | /usr/xpg4/bin/grep -q -e "SOCK_DGRAM.*;.*port: $1"; then
      proto="UDP"
    fi
    if pfiles "$pid" | tr '\n' ';' | /usr/xpg4/bin/grep -q -e "SOCK_STREAM.*;.*port: $1"; then
      proto="TCP"
    fi
    if [ -z "$proto" ]; then
      proto="(TCP, UDP, or something else)"
    fi
    echo "Port $1 $proto is being used by pid $pid"
    success=1
  fi
done

