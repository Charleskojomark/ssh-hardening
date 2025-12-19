#!/bin/bash

source scripts/logging.sh

SSH_CONFIG="/etc/ssh/sshd_config"
SSH_BACKUP_CONFIG="${SSH_CONFIG}.bak"

SSH_CONFIG_DIRECTORY="${SSH_CONFIG}.d"
SOURCE_CONFIG="configs/ssh-hardening.conf"
DEST_CONFIG="${SSH_CONFIG_DIRECTORY}/hardening.conf"

backup_ssh() {
    log "Backing up ssh..."
    sudo cp "$SSH_CONFIG" "$SSH_BACKUP_CONFIG"
}

apply_ssh_hardening() {
    log "Applying ssh hardening"
    sudo cp "$SOURCE_CONFIG" "$DEST_CONFIG"
}

validate_ssh() {
    log "Validating ssh configuration"
    sudo sshd -t
}

restart_ssh() {
    log "Restarting ssh"
    sudo systemctl restart sshd
}