#!/bin/bash
echo "Cleaning /tmp at $(date)" >> /var/log/cleanup.log
rm -rf /tmp/* 2>/dev/null
