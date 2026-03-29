#!/bin/bash
# ==========================================
# Script 4: Log File Analyzer
# Usage: ./log_analyzer.sh /var/log/syslog error
# ==========================================

LOGFILE=$1
KEYWORD=${2:-"error"}
COUNT=0

# -------- Check file --------
if [ ! -f "$LOGFILE" ]; then
    echo "Error: File not found!"
    exit 1
fi

# -------- Check empty file (retry logic) --------
if [ ! -s "$LOGFILE" ]; then
    echo "File is empty. Retrying in 2 seconds..."
    sleep 2
    if [ ! -s "$LOGFILE" ]; then
        echo "Still empty. Exiting."
        exit 1
    fi
fi

# -------- Processing --------
while IFS= read -r LINE; do
    if echo "$LINE" | grep -iq "$KEYWORD"; then
        COUNT=$((COUNT + 1))
    fi
done < "$LOGFILE"

# -------- Output --------
echo "========================================="
echo "Keyword '$KEYWORD' found $COUNT times"
echo "========================================="

echo ""
echo "Last 5 matching lines:"
grep -i "$KEYWORD" "$LOGFILE" | tail -5
