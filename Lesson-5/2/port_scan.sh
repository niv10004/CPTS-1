#!/bin/bash

if [ -z "$1" ]; then
  echo "Usage: $0 <IP_ADDRESS>"
  exit 1
fi

TARGET=$1
MAX_PROCESSES=100  # Tune this number for speed vs system load

scan_port() {
  port=$1
  if timeout 1 bash -c "echo > /dev/tcp/$TARGET/$port" 2>/dev/null; then
    echo "[+] Port $port is open"

    # Try to grab the banner
    banner=$(timeout 2 bash -c "exec 3<>/dev/tcp/$TARGET/$port; head -n 1 <&3" 2>/dev/null)
    if [ -n "$banner" ]; then
      echo "    Banner: $banner"
    else
      echo "    No banner received"
    fi
  fi
}

export -f scan_port
export TARGET

# Run the scan in parallel
seq 1 1024 | xargs -n1 -P "$MAX_PROCESSES" bash -c 'scan_port "$@"' _
