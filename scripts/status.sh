echo "=== Services ==="
systemctl status dump1090-mutability --no-pager
systemctl status fr24feed --no-pager
systemctl status piaware --no-pager

echo
echo "=== Ports ==="
ss -ltnp | egrep '30005|8754|5000'

echo
echo "=== Sample Aircraft ==="
jq '.aircraft[0]' /run/dump1090-mutability/aircraft.json
