#!/bin/bash

set -euo pipefail

source scripts/logging.sh

setup_failban() {
    log "Installing and configuring fail2ban..."

    sudo apt install -y fail2ban
    cp /configs/jail.local /etc/fail2ban/jail.local
    
    sudo systemctl enable fail2ban
    sudo systemctl restart fail2ban
}