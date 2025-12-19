#!/bin/bash

set -euo pipefail

source scripts/logging.sh

if [[ -f ".env" ]]; then
    source .env
fi

NEWUSER="${NEWUSER:-secureuser}"

create_user() {
    if ! id "$NEWUSER" &>/dev/null ; then
        sudo adduser --disabled-password --gecos "" $NEWUSER
        sudo usermod -aG sudo "$NEWUSER"
    fi
}


