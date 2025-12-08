#!/bin/bash
# Automated Daily Report Generator - Part 1
#  Gather disk usage, failed, failed logins, and active processes

REPORT_FILE="/tmp/daily_report.txt"

# Start the report
echo "==== Daily Ssystem Report ====" > "$REPORT_FILE"
echo "Date: $(date)" >> "$REPORT_FILE"
echo >> "$REPORT_FILE"
