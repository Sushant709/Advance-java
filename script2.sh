#!/bin/bash

PACKAGE="git"

if dpkg -l | grep -q $PACKAGE; then
    echo "$PACKAGE is installed"
    apt show $PACKAGE | grep -E 'Version|Maintainer'
else
    echo "$PACKAGE not installed"
fi

case $PACKAGE in
    git) echo "Git: distributed version control system" ;;
    apache2) echo "Apache: web server" ;;
    mysql) echo "MySQL: database system" ;;
    firefox) echo "Firefox: web browser" ;;
esac
