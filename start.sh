#!/usr/bin/env bash
set -euo pipefail
apt-get update && apt-get install -y socat >/dev/null 2>&1 || true
socat TCP-LISTEN:,fork,reuseaddr TCP:127.0.0.1:8123 &
exec /entrypoint.sh
