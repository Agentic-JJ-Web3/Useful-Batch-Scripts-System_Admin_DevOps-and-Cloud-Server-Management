#!/bin/bash
echo "System Information"
echo "------------------"
echo "Hostname: $(hostname)"
echo "OS: $(uname -s)"
echo "Release: $(uname -r)"
echo "Architecture: $(uname -m)" 
echo "CPU: $(lscpu | grep 'Model name' | cut -d':' -f2-)"
echo "Memory: $(free -h | grep 'Mem' | awk '{print $2}')"
echo "Disk Space: $(df -h | grep '^/dev' | awk '{print $1, $5, $6}' )"


