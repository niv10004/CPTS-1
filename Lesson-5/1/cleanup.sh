#!/bin/bash
echo "Cleaning /tmp at $(date)" >> /tmp/cleanup.log
rm -rf /tmp/* 2>/dev/null
