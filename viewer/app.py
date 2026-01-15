import json, os
from flask import Flask, jsonify, send_from_directory

AIRCRAFT_JSON = os.getenv("AIRCRAFT_JSON", "/run/dump1090-mutability/aircraft.json")
HOME_LAT = float(os.getenv("HOME_LAT", "0"))
HOME_LON = float(os.getenv("HOME_LON", "0"))

app = Flask(__name__)

@app.route("/api/aircraft")
def aircraft():
    try:
        with open(AIRCRAFT_JSON) as f:
            return jsonify(json.load(f))
    except Exception as e:
        return jsonify({"error": str(e)}), 500

@app.route("/api/home")
def home():
    return jsonify({"lat": HOME_LAT, "lon": HOME_LON})

@app.route("/")
def index():
    return send_from_directory(".", "index.html")

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=int(os.getenv("PORT", "5000")))
