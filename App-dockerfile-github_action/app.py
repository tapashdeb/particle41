from flask import Flask, request, jsonify
from datetime import datetime

app = Flask(__name__)

@app.route("/", methods=["GET"])
def get_time():
    # Get client IP (handles proxies if present)
    if request.headers.get("X-Forwarded-For"):
        ip = request.headers.get("X-Forwarded-For").split(",")[0]
    else:
        ip = request.remote_addr

    response = {
        "timestamp": datetime.utcnow().isoformat() + "Z",
        "ip": ip
    }

    return jsonify(response)

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8000)