#!/bin/bash

set -euo pipefail

source scripts/firewall.sh
source scripts/fail2ban.sh
source scripts/users.sh
source scripts/ssh.sh
source scripts/audit.sh

configure_firewall
setup_failban
create_user

backup_ssh
apply_ssh_hardening
validate_ssh
restart_ssh

generate_audit

echo "hardening completed successfully"