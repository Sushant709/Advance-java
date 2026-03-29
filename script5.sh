#!/bin/bash
# ==========================================
# Script 5: Open Source Manifesto Generator
# ==========================================

echo "Answer the following to generate your manifesto:"
echo ""

# -------- User Input --------
read -p "1. Name an open-source tool you use daily: " TOOL
read -p "2. What does 'freedom' mean to you (one word)? " FREEDOM
read -p "3. What would you build and share freely? " BUILD

DATE=$(date '+%d %B %Y')
USER=$(whoami)
OUTPUT="manifesto_${USER}.txt"

# -------- Generate Manifesto --------
echo "----------------------------------------" > $OUTPUT
echo "Open Source Manifesto — $USER" >> $OUTPUT
echo "Date: $DATE" >> $OUTPUT
echo "----------------------------------------" >> $OUTPUT
echo "" >> $OUTPUT

echo "I believe in the power of open source." >> $OUTPUT
echo "Using tools like $TOOL, I embrace the idea of $FREEDOM." >> $OUTPUT
echo "I commit to building $BUILD and sharing it freely with the world." >> $OUTPUT
echo "Knowledge should not be restricted — it should be accessible to all." >> $OUTPUT

echo ""
echo "Manifesto saved to $OUTPUT"
echo ""
cat $OUTPUT

# Example alias (for learning purpose)
# alias manifesto='./manifesto_generator.sh'
