# ping sweep
#!/bin/bash
# Scans local subnet for live hosts and logs results

nmap -sn 192.168.1.0/24 > /tmp/network_scan.log
echo "Last scan: $(date)" >> /tmp/network_scan.log
