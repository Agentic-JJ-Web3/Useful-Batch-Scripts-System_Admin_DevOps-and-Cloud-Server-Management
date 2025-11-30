#!/bin/bash
echo "System Settings"
echo "---------------"
echo "1. Show IP Address"
echo "2. Show Network Connections"
echo "3. Show Running Processes"
echo "4. Show System Logs"

read -p "Enter your choice: " choice

case $choice in
  1) ip addr show ;;
  2) netstat -tulpn ;;
  3) ps aux ;;
  4) journalctl -n 20 ;;
  *) echo "Invalid choice" ;;
esac
  
