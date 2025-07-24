#!/bin/bash

echo "Log entry at:" $(date +"%Y-%m-%d %H:%M:%S") >> "$HOME/Desktop/process_log.txt"
ps aux >> "$HOME/Desktop/process_log.txt"
echo "-" >> "$HOME/Desktop/process_log.txt"
 