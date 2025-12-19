#!/bin/bash

set -euo pipefail

source scripts/logging.sh

setup_failban() {
    log "Installing and configuring fail2ban..."

    SCRIPT_DIR="$(dirname "$0")"
    JAIL_LOCAL="$SCRIPT_DIR/configs/jail.local"

    sudo apt install -y fail2ban
    sudo cp "$JAIL_LOCAL" /etc/fail2ban/jail.local
    
    sudo systemctl enable fail2ban
    sudo systemctl restart fail2ban
}