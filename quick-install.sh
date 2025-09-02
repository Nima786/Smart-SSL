#!/usr/bin/env bash
set -Eeuo pipefail
if [[ ${EUID:-0} -ne 0 ]]; then
  if command -v sudo >/dev/null 2>&1; then exec sudo -E bash "$0" "$@"; else echo "Run as root"; exit 1; fi
fi
BIN="/usr/local/bin/smart-ssl"
RAW="https://raw.githubusercontent.com/Nima786/Smart-SSL/main/smart-ssl"
echo "[*] Installing Smart-SSL…"
curl -fsSL "$RAW" -o "$BIN"
chmod +x "$BIN"
exec smart-ssl
