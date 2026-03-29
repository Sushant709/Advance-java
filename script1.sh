#!/bin/bash
# ==========================================
# Script 1: System Identity Report
# Author: Your Name
# ==========================================

# -------- Variables --------
STUDENT_NAME="Your Name"
SOFTWARE_CHOICE="Git"

# -------- System Info --------
KERNEL=$(uname -r)
USER_NAME=$(whoami)
UPTIME=$(uptime -p)
DATE=$(date '+%d %B %Y, %H:%M:%S')

# Get distro name
if command -v lsb_release &>/dev/null; then
    DISTRO=$(lsb_release -d | cut -f2)
else
    DISTRO=$(cat /etc/os-release | grep PRETTY_NAME | cut -d= -f2 | tr -d '"')
fi

HOME_DIR=$HOME

# -------- Output --------
echo "========================================="
echo "   Open Source Audit — $STUDENT_NAME"
echo "========================================="
echo "Software        : $SOFTWARE_CHOICE"
echo "Distro          : $DISTRO"
echo "Kernel Version  : $KERNEL"
echo "User            : $USER_NAME"
echo "Home Directory  : $HOME_DIR"
echo "System Uptime   : $UPTIME"
echo "Current Date    : $DATE"
echo "License         : GNU General Public License (GPL)"
echo "========================================="
