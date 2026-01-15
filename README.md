# Home Flight Data Contributor
This experiment was built to deepen practical understanding of flight data generation and limitations, beyond consuming aviation APIs as black boxes.

## End-to-end ADS-B setup using a Raspberry Pi and RTL-SDR:

- dump1090-mutability (decoder + JSON)
- Flightradar24 feeder (fr24feed)
- FlightAware feeder (piaware)
- Lightweight live flight map centered on your home

![Local Web View](media/viewer1.jpg)
![Flighradar24 feed](media/flighradar-feed2.jpg)
![FlightAware feed](media/piaware-feeed1.jpg)

Tested on Raspberry Pi 4 / Debian Bookworm.

---

## Hardware

- Raspberry Pi 4 (2GB+ recommended)
- RTL-SDR v3 or equivalent
- External ADS-B antenna strongly recommended
- Stable power supply (USB issues cause dongle wedges)

![RTL-SDR dongle](media/dongle-1.jpg)
![RTL-SDR dongle](media/dongle-2.jpg)

---

## Quick Start

```bash
git clone https://github.com/xalfeiran/HomeFlightDataContributor.git
cd HomeFlightDataContributor

sudo bash scripts/install_base.sh
sudo bash scripts/install_dump1090_mutability.sh
sudo bash scripts/install_fr24feed.sh
sudo bash scripts/install_piaware.sh
sudo bash scripts/enable_services.sh
```

---

## Services & Ports

| Service | Port | Description |
| --- | --- | --- |
| dump1090 Beast TCP | 30005 | ADS-B data |
| dump1090 JSON | — | `/run/dump1090-mutability/aircraft.json` |
| fr24feed web | 8754 | Status UI |

---

## Live Viewer

Edit your home location:

```bash
cp config/viewer.env.example config/viewer.env
nano config/viewer.env
```

Then:

```bash
cd viewer
python3 -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
python app.py
```

Open:

`http://<PI_IP>:5000`

---

## Features

- Aircraft icon rotated by track
- Green = climbing, Red = descending
- Flight number label
- Zero heavy processing (reads dump1090 JSON only)

## Notes

- MLAT disabled is fine for local visualization
- Feeder benefits remain active if uptime & data quality are good
- This stack is safe to run alongside production systems

## Project context & learnings

By running a full local ADS-B stack (SDR → dump1090 → feeders → visualization), several key insights became clear:

Flight data is constructed, not absolute
Positions, ETAs, and statuses are derived from distributed RF sources, fusion logic, and confidence thresholds — not a single authoritative feed.

Data quality is physics-bound
Antenna placement, RF noise, power stability, and USB reliability have more impact than software configuration. Many “data gaps” originate at the radio layer.

Raw ADS-B is often sufficient
For situational awareness, monitoring, and operational context, direct ADS-B data provides reliable, low-latency insight without MLAT complexity.

Edge-side Python is a strong exploration tool
Consuming dump1090 JSON snapshots with Python enables fast iteration, low resource usage, and clear visibility into real-world constraints.

Feeder participation improves API usage decisions
Contributing data to FR24 and FlightAware provides valuable context for interpreting API fields, latency, and coverage — improving downstream product decisions. 

## Takeaway

This project is not about replacing commercial flight data APIs.
It is about building intuition and technical judgment to consume aviation data more intelligently in operational and product systems.

---

## License

MIT
