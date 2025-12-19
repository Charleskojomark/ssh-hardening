#!/bin/bash

source scripts/logging.sh

AUDIT_LOG="$HOME/DEV/ssh_hardening_audit.log"

generate_audit() {
    log "Generating audit report"
    {
        echo "Date: $(date)"

        echo "__Users__"
        cut -d: -f1 /etc/passwd

        echo "__Sudo users__"
        getent group sudo

        echo "__Firewall__"
        sudo ufw status verbose

        echo "__Open Ports__"
        sudo ss -tlnp

        echo "__Fail2ban__"
        sudo fail2ban-client status
    } | tee "$AUDIT_LOG"
}