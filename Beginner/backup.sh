#!/bin/bash

# Simple File Backup Script
# Usage: ./backup.sh /path/to/folder
# This script copies a folder to a timestamped backup location

# Check if user provided a folder to backup
if [ $# -eq 0 ]; then
  echo "Usage: $0 /path/to/folder"
  exit 1
fi

# Get the folder to backup
SOURCE="$1"

# Check if source folder exists
if [ ! -e "$SOURCE" ]; then
  echo "Error: '$SOURCE' does not exist"
  exit 1
fi

# Set backup destination (create ~/backups folder if needed)
BACKUP_DIR="$HOME/backups"
mkdir -p "$BACKUP_DIR"

# Create a timestamp for the backup folder (example: 20251203_143025)
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
BACKUP_DEST="$BACKUP_DIR/backup_$TIMESTAMP"

# Copy the folder/file to the backup location
echo "Backing up '$SOURCE'..."
cp -r "$SOURCE" "$BACKUP_DEST"

# Show completion message
echo "Backup complete! Saved to: $BACKUP_DEST"
