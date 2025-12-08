#!/bin/bash
# Automated Daily Report Generator - Part 1
#  Gather disk usage, failed, failed logins, and active processes

REPORT_FILE="/tmp/daily_report.txt"

# Start the report
echo "==== Daily Ssystem Report ====" > "$REPORT_FILE"
echo "Date: $(date)" >> "$REPORT_FILE"
echo >> "$REPORT_FILE"

# Disk Usage Section
echo "---- Disk Usage ----" >> "$REPORT_FILE"
df -h >> "$REPORT_FILE"
echo >> "$REPORT_FILE"

# Failed Logins Attempts Section
echo "---- Failed Logins Atempt ----"
lastb | head -10 >> "$REPORT_FILE"  # Displays a list of last logged users focusing on the failed login attempts
echo >> "$REPORT_FILE" # Gives line spacing

