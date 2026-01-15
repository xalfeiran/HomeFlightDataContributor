#!/usr/bin/env bash
set -e

curl -s https://repo-feed.flightradar24.com/install_fr24_rpi.sh | bash

echo
echo "IMPORTANT:"
echo "Run: sudo fr24feed --signup"
echo "Choose: Beast-TCP, host 127.0.0.1, port 30005"
