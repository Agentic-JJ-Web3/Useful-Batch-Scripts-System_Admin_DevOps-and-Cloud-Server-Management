#!/bin/bash

# Simple System Information Displayer
# Shows CPU, RAM, disk usage, and uptime in a clean format
# Usage: ./system_info.sh

# Color codes for pretty output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color
echo
echo -e "${BLUE}====== SYSTEM INFORMATION ======${NC}\n"

# Get and display hostname
echo -e "${GREEN}Hostname:${NC}"
hostname
echo

# Get and display uptime
echo -e "${GREEN}Uptime:${NC}"
uptime -p
echo

# Get CPU information
echo -e "${GREEN}CPU Information:${NC}"
grep "model name" /proc/cpuinfo | head -1 | awk -F': ' '{print $2}'
grep -c "^processor" /proc/cpuinfo | awk '{print "Cores: " $1}'
echo

# Get RAM information (total, used, available)
echo -e "${GREEN}Memory (RAM):${NC}"
# Extract values from /proc/meminfo using grep and awk
TOTAL=$(grep MemTotal /proc/meminfo | awk '{print int($2/1024)" MB"}')
AVAILABLE=$(grep MemAvailable /proc/meminfo | awk '{print int($2/1024)" MB"}')
USED=$(free -m | awk 'NR==2 {print $3" MB"}')

echo "Total: $TOTAL"
echo "Used: $USED"
echo "Available: $AVAILABLE"
echo

# Get disk usage for root filesystem
echo -e "${GREEN}Disk Usage (Root):${NC}"
df -h / | awk 'NR==2 {print "Total: " $2 "\nUsed: " $3 "\nAvailable: " $4 "\nUsage: " $5}'
echo

# Get system uptime in seconds and convert to days, hours, minutes
echo -e "${GREEN}System Uptime:${NC}"
UPTIME_SECONDS=$(awk '{print int($1)}' /proc/uptime)
UPTIME_DAYS=$((UPTIME_SECONDS / 86400))
UPTIME_HOURS=$(( (UPTIME_SECONDS % 86400) / 3600 ))
UPTIME_MINS=$(( (UPTIME_SECONDS % 3600) / 60 ))

echo "${UPTIME_DAYS} days, ${UPTIME_HOURS} hours, ${UPTIME_MINS} minutes"
echo

# Get OS information
echo -e "${GREEN}Operating System:${NC}"
lsb_release -d 2>/dev/null | awk -F'\t' '{print $2}' || cat /etc/os-release 2>/dev/null | grep "PRETTY_NAME" | cut -d'"' -f2

echo -e "\n${BLUE}================================${NC}"
