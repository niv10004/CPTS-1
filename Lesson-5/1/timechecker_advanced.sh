#!/bin/bash

# Default city-timezone pairs
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

print_usage() {
  echo "Usage:"
  echo "  $0                     Show current time in default cities"
  echo "  $0 --city <City>       Show time for a specific city (e.g. --city Berlin)"
  echo "  $0 --add City=TZ       Add a temporary city-timezone pair (e.g. --add Paris=Europe/Paris)"
  echo "  $0 --help              Show this help message"
}

show_time_for_city() {
  local city="$1"
  local tz="${cities[$city]}"
  if [ -z "$tz" ]; then
    echo "❌ City '$city' not found."
    exit 1
  fi
  TZ="$tz" date +"$city: %Y-%m-%d %H:%M:%S (%Z)"
}

if [[ "$1" == "--help" ]]; then
  print_usage
  exit 0

elif [[ "$1" == "--city" && -n "$2" ]]; then
  city="$2"
  show_time_for_city "$city"
  exit 0

elif [[ "$1" == "--add" && "$2" =~ ^[^=]+=[^=]+$ ]]; then
  custom_city="${2%%=*}"
  custom_tz="${2#*=}"
  echo "🕓 $custom_city: $(TZ="$custom_tz" date '+%Y-%m-%d %H:%M:%S (%Z)')"
  exit 0

elif [[ -n "$1" ]]; then
  echo "❌ Invalid option: $1"
  print_usage
  exit 1
fi

# Default mode: print time for all predefined cities
echo "🌍 Current time in different locations:"
echo "---------------------------------------"
for city in "${!cities[@]}"; do
  TZ="${cities[$city]}" date +"$city: %Y-%m-%d %H:%M:%S (%Z)"
done
