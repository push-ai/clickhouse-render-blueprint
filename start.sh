#!/usr/bin/env bash
set -euo pipefail

# Start ClickHouse server in background
/entrypoint.sh &

# Give the server a moment to start
sleep 2

# Forward Render $PORT to ClickHouse HTTP 8123 without apt/socat
if command -v nc >/dev/null 2>&1; then
  while true; do nc -lk -p ${PORT} -e /bin/sh -c "exec nc 127.0.0.1 8123"; done &
else
  # Fallback: no-op if nc unavailable (Render already detected 8123 as primary)
  :
fi

wait -n
