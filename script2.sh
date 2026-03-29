#!/bin/bash
# ==========================================
# Script 2: FOSS Package Inspector
# ==========================================

PACKAGE="git"

echo "Checking package: $PACKAGE"
echo "--------------------------------"

# Detect package manager
if command -v dpkg &>/dev/null; then
    PM="dpkg"
elif command -v rpm &>/dev/null; then
    PM="rpm"
else
    echo "No supported package manager found."
    exit 1
fi

# Check installation
if [ "$PM" = "dpkg" ]; then
    if dpkg -l | grep -qw "$PACKAGE"; then
        echo "$PACKAGE is installed."
        apt show $PACKAGE 2>/dev/null | grep -E 'Version|Maintainer|Description'
    else
        echo "$PACKAGE is NOT installed."
    fi
else
    if rpm -q $PACKAGE &>/dev/null; then
        echo "$PACKAGE is installed."
        rpm -qi $PACKAGE | grep -E 'Version|License|Summary'
    else
        echo "$PACKAGE is NOT installed."
    fi
fi

# -------- Case Statement --------
echo "--------------------------------"
case $PACKAGE in
    git) echo "Git: Distributed version control system built for speed and collaboration." ;;
    apache2|httpd) echo "Apache: The web server that powers the internet." ;;
    mysql) echo "MySQL: Open-source relational database system." ;;
    firefox) echo "Firefox: Privacy-focused open web browser." ;;
    vlc) echo "VLC: Plays almost any multimedia format." ;;
    *) echo "Unknown package — but still part of the open-source world!" ;;
esac
