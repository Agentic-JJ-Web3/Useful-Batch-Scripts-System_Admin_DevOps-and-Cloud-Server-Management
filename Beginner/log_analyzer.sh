# Simple Log File Analyzer (Beginner Friendly)
# Usage: ./log_analyzer.sh logfile.log
# Features: Extract errors/warnings, count occurrences, generate summary

if [ $# -lt 1 ]; then
	echo "Usage: $0 logfile.log"
	exit 1
fi

LOGFILE="$1"
if [ ! -f "$LOGFILE" ]; then
	echo "Error: File '$LOGFILE' not found."
	exit 1
fi

echo "Analyzing log file: $LOGFILE"
echo "-----------------------------------"

# Count total lines
TOTAL=$(wc -l < "$LOGFILE")
echo "Total lines: $TOTAL"

# Count errors
ERRORS=$(grep -i 'error' "$LOGFILE" | wc -l)
echo "Error entries: $ERRORS"

# Count warnings
WARNINGS=$(grep -i 'warn' "$LOGFILE" | wc -l)
echo "Warning entries: $WARNINGS"

# Top 5 most common error messages (case-insensitive)
echo
echo "Top 5 error messages:"
grep -i 'error' "$LOGFILE" | awk -F':' '{print $NF}' | sort | uniq -c | sort -nr | head -5

# Top 5 most common warning messages
echo
echo "Top 5 warning messages:"
grep -i 'warn' "$LOGFILE" | awk -F':' '{print $NF}' | sort | uniq -c | sort -nr | head -5

echo
echo "Done."
