#!/bin/bash

set -euo pipefail

LOGFILE="$HOME/DEV/server_hardening.log"

log() {
    printf "[%s] %s\n" "$(date '+%F %T')" "$1" | tee -a "$LOGFILE"
}