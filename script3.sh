#!/bin/bash

DIRS=("/etc" "/var/log" "/home" "/usr/bin")

for DIR in "${DIRS[@]}"; do
    if [ -d "$DIR" ]; then
        PERMS=$(ls -ld $DIR | awk '{print $1,$3,$4}')
        SIZE=$(du -sh $DIR 2>/dev/null | cut -f1)
        echo "$DIR => $PERMS | Size: $SIZE"
    fi
done

if [ -d "/etc/git" ]; then
    ls -ld /etc/git
fi
