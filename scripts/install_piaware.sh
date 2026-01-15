#!/usr/bin/env bash
set -e

curl -s https://flightaware.com/adsb/piaware/files/install.sh | bash

echo
echo "Visit https://flightaware.com/adsb/piaware/claim"
echo "to claim your feeder"
