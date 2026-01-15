#!/usr/bin/env bash
set -e

apt install -y dump1090-mutability

echo "[+] Enabling dump1090-mutability"
systemctl enable dump1090-mutability
systemctl restart dump1090-mutability

echo "[✓] dump1090-mutability installed"
