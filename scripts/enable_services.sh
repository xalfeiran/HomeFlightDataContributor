#!/usr/bin/env bash
systemctl enable dump1090-mutability
systemctl enable fr24feed
systemctl enable piaware

systemctl restart dump1090-mutability
systemctl restart fr24feed
systemctl restart piaware

echo "[✓] All services enabled"
