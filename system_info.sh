#!/bin/bash
echo "System Information"
echo "------------------"
echo "Hostname: $(hostname)"
echo "OS: $(uname -s)"
echo "Release: $(uname -r)"
echo "Architecture: $(uname -m)" 
echo "CPU: $(lscpu | grep 'Model name' | cut -d':' -f2-)"


