#!/bin/bash

THRESHOLD=80

echo "Disk Usage Overview"
echo "------------------------"
printf "%-20s %-10s %-10s %-10s\n" "Mount Point" "Used" "Avail" "Use%"

# Loop through df output (excluding tmpfs, devtmpfs, etc.)
df -hT -x tmpfs -x devtmpfs | awk 'NR>1 {print $7, $3, $4, $6}' | while read mount used avail usep; do
  use=${usep%\%}  # Remove % sign

  # Print usage table
  printf "%-20s %-10s %-10s %-10s" "$mount" "$used" "$avail" "$usep"

  # Print alert if above threshold
  if [ "$use" -ge "$THRESHOLD" ]; then
    echo " WARNING: High usage!"
  else
    echo
  fi
done


