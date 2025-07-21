#!/bin/bash
# Logs performance metrics to /var/log/performance.log

timestamp=$(date "+%Y-%m-%d %H:%M:%S")
echo "[$timestamp] CPU & Memory:" >> /var/log/performance.log
top -b -n1 | head -n 5 >> /var/log/performance.log
echo "--------------------------" >> /var/log/performance.log

# TO find the log, do cat /var/log/performance.log
