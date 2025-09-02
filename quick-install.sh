#!/usr/bin/env bash
set -Eeuo pipefail

# One-command installer for Smart-SSL (minimal)
# Usage:
#   bash <(curl -fsSL https://raw.githubusercontent.com/Nima786/Smart-SSL/main/quick-install.sh)

# Re-exec with sudo if not root
if [[ ${EUID:-0} -ne 0 ]]; then
  if command -v sudo >/dev/null 2>&1; then
    exec sudo -E bash "$0" "$@"
  else
    echo "Please run as root." >&2
    exit 1
  fi
fi

BIN="/usr/local/bin/smart-ssl"
RAW="${SMARTSSL_RAW_URL:-https://raw.githubusercontent.com/Nima786/Smart-SSL/main/smart-ssl}"

echo "[*] Installing Smart-SSL to ${BIN}…"
curl -fsSL "$RAW" -o "$BIN"
chmod +x "$BIN"

echo "[*] Launching Smart-SSL menu…"
exec smart-ssl
