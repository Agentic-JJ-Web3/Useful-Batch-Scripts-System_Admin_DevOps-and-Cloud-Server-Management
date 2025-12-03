#!/bin/bash

# Bulk File Renamer
# Rename multiple files matching a pattern with sequential numbering
# Includes undo capability by logging original names
# Usage: ./file_renamer.sh "*.txt" "document"

# Color codes for output
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Check if user provided arguments
if [ $# -lt 2 ]; then
    echo -e "${RED}Error: Not enough arguments${NC}"
    echo "Usage: ./file_renamer.sh <pattern> <new_name>"
    echo "Example: ./file_renamer.sh '*.txt' 'document'"
    exit 1
fi

PATTERN="$1"        # File pattern to match (e.g., *.txt)
NEW_NAME="$2"       # New base name (e.g., document)
COUNTER=1           # Start numbering from 1
LOG_FILE="rename_undo.log"  # Log file for undo

# Check if any files match the pattern
if ! ls $PATTERN 1> /dev/null 2>&1; then
    echo -e "${RED}Error: No files matching pattern '$PATTERN' found${NC}"
    exit 1
fi

echo -e "${YELLOW}Files to rename:${NC}"
ls -1 $PATTERN

# Ask user for confirmation
read -p "Continue with renaming? (y/n): " CONFIRM
if [ "$CONFIRM" != "y" ]; then
    echo -e "${RED}Cancelled.${NC}"
    exit 0
fi

# Clear old log file
> "$LOG_FILE"

# Loop through each file matching the pattern
for FILE in $PATTERN; do
    # Get file extension (e.g., .txt from document.txt)
    EXTENSION="${FILE##*.}"
    
    # Create new filename with counter
    NEW_FILE="${NEW_NAME}_${COUNTER}.${EXTENSION}"
    
    # Log the original name for undo capability
    echo "$NEW_FILE -> $FILE" >> "$LOG_FILE"
    
    # Rename the file
    mv "$FILE" "$NEW_FILE"
    
    echo -e "${GREEN}✓ Renamed: $FILE → $NEW_FILE${NC}"
    
    # Increment counter for next file
    ((COUNTER++))
done

echo -e "${GREEN}Done! Renamed $((COUNTER-1)) files.${NC}"
echo -e "${YELLOW}Undo log saved to: $LOG_FILE${NC}"
echo -e "${YELLOW}To undo, run: ./file_renamer_undo.sh${NC}"