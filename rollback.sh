#!/bin/bash

set -euo pipefail

source scripts/logging.sh
source scripts/ssh.sh

SSH_CONFIG="/etc/ssh/sshd_config"
SSH_BACKUP_CONFIG="${SSH_CONFIG}.bak"
SSH_CONFIG_DIRECTORY="${SSH_CONFIG}.d"
FAILED_CONFIG="${SSH_CONFIG_DIRECTORY}/hardening.conf"

sudo rm -f "$FAILED_CONFIG"

if [[ -f "$SSH_BACKUP_CONFIG" ]]; then
    sudo cp "$SSH_BACKUP_CONFIG" "$SSH_CONFIG"
    log "Restored SSH backup: $SSH_BACKUP_CONFIG → $SSH_CONFIG"
    restart_ssh
    echo "Rollback Completed Successfully"
else
    echo "Backup Not Found"
fi