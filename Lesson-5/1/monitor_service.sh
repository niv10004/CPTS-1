!/bin/bash
# monitor_service.sh
# Description: Displays all currently running systemd services.

echo "🟢 Running Services:"
echo "----------------------------"

systemctl list-units --type=service --state=running | awk 'NR>1 {print $1}' | sed '/^$/d'
