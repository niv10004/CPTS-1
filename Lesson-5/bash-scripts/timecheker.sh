#!/bin/bash

# Array of locations with their timezone identifiers
declare -A cities=(
  ["New_York"]="America/New_York"
  ["London"]="Europe/London"
  ["Berlin"]="Europe/Berlin"
  ["Tel_Aviv"]="Asia/Jerusalem"
  ["Tokyo"]="Asia/Tokyo"
  ["Sydney"]="Australia/Sydney"
  ["Los_Angeles"]="America/Los_Angeles"
  ["São_Paulo"]="America/Sao_Paulo"
  ["Dubai"]="Asia/Dubai"
  ["Moscow"]="Europe/Moscow"
)

echo "🌍 Current time in different locations:"
echo "---------------------------------------"

for city in "${!cities[@]}"; do
  TZ="${cities[$city]}" date +"$city: %Y-%m-%d %H:%M:%S (%Z)"
done
