#!/bin/bash
# ==========================================
# Script 3: Disk and Permission Auditor
# ==========================================

DIRS=("/etc" "/var/log" "/home" "/usr/bin" "/tmp")

echo "========== Directory Audit Report =========="
echo ""

for DIR in "${DIRS[@]}"; do
    if [ -d "$DIR" ]; then
        PERMS=$(ls -ld $DIR | awk '{print $1}')
        OWNER=$(ls -ld $DIR | awk '{print $3}')
        GROUP=$(ls -ld $DIR | awk '{print $4}')
        SIZE=$(du -sh $DIR 2>/dev/null | cut -f1)

        echo "Directory : $DIR"
        echo "Permissions: $PERMS"
        echo "Owner     : $OWNER"
        echo "Group     : $GROUP"
        echo "Size      : $SIZE"
        echo "--------------------------------------"
    else
        echo "$DIR does not exist"
    fi
done

# -------- Git Config Check --------
echo ""
echo "Checking Git configuration directory..."

if [ -d "/etc/git" ]; then
    ls -ld /etc/git
elif [ -f "$HOME/.gitconfig" ]; then
    echo "User Git config found:"
    ls -l $HOME/.gitconfig
else
    echo "Git config directory not found."
fi
