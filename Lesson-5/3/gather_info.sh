#system info snapshot
#!/bin/bash
# Saves system info to /var/log/sysinfo.log

echo "===== System Info @ $(date) =====" > /tmp/sysinfo.log
uname -a >> /tmp/sysinfo.log
df -h >> /tmp/sysinfo.log
uptime >> /tmp/sysinfo.log
