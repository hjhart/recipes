#!/usr/bin/env python3
"""
Webhook server for recipe imports triggered from Apple Reminders via Shortcuts.
Listens on LAN IP port 9847. Accepts POST /import with JSON {"url": "...", "token": "..."}
and runs `claude -p "/import-recipe <url>"` in the background.
"""

import http.server
import json
import logging
import os
import subprocess
import threading
import urllib.parse
from datetime import datetime

PORT = 9847
BIND_HOST = "192.168.50.2"
PROJECT_DIR = "/home/james/workspace/recipes"
CLAUDE_BIN = "/home/james/.local/bin/claude"
LOG_FILE = os.path.join(PROJECT_DIR, "logs", "webhook.log")
TOKEN_FILE = os.path.expanduser("~/.recipe-webhook-token")

os.makedirs(os.path.dirname(LOG_FILE), exist_ok=True)

logging.basicConfig(
    level=logging.INFO,
    format="%(asctime)s %(levelname)s %(message)s",
    handlers=[
        logging.FileHandler(LOG_FILE),
        logging.StreamHandler(),
    ],
)
log = logging.getLogger(__name__)


def load_token():
    try:
        with open(TOKEN_FILE) as f:
            return f.read().strip()
    except FileNotFoundError:
        log.error(f"Token file not found: {TOKEN_FILE}")
        return None


def is_valid_url(url: str) -> bool:
    try:
        parsed = urllib.parse.urlparse(url)
        return parsed.scheme in ("http", "https") and bool(parsed.netloc)
    except Exception:
        return False


def run_import(url: str):
    log.info(f"Starting import for: {url}")
    env = os.environ.copy()
    env["PATH"] = f"/home/james/.local/bin:{env.get('PATH', '/usr/bin:/bin')}"
    env["HOME"] = "/home/james"

    env_file = os.path.join(PROJECT_DIR, ".env")
    if os.path.exists(env_file):
        with open(env_file) as f:
            for line in f:
                line = line.strip()
                if line and not line.startswith("#") and "=" in line:
                    k, _, v = line.partition("=")
                    env[k.strip()] = v.strip().strip('"')

    cmd = [CLAUDE_BIN, "-p", f"/import-recipe {url}", "--dangerously-skip-permissions"]
    try:
        result = subprocess.run(cmd, cwd=PROJECT_DIR, env=env,
                                capture_output=True, text=True, timeout=300)
        if result.returncode == 0:
            log.info(f"Import succeeded for {url}")
        else:
            log.error(f"Import failed for {url} (exit {result.returncode})\n{result.stderr[-1000:]}")
    except subprocess.TimeoutExpired:
        log.error(f"Import timed out for {url}")
    except Exception as e:
        log.error(f"Import exception for {url}: {e}")


class WebhookHandler(http.server.BaseHTTPRequestHandler):
    def log_message(self, format, *args):
        log.info(f"{self.address_string()} {format % args}")

    def send_json(self, code: int, body: dict):
        data = json.dumps(body).encode()
        self.send_response(code)
        self.send_header("Content-Type", "application/json")
        self.send_header("Content-Length", str(len(data)))
        self.end_headers()
        self.wfile.write(data)

    def do_GET(self):
        if self.path == "/health":
            self.send_json(200, {"status": "ok", "time": datetime.utcnow().isoformat()})
        else:
            self.send_json(404, {"error": "not found"})

    def do_POST(self):
        if self.path != "/import":
            self.send_json(404, {"error": "not found"})
            return

        length = int(self.headers.get("Content-Length", 0))
        try:
            body = json.loads(self.rfile.read(length))
        except Exception:
            self.send_json(400, {"error": "invalid JSON"})
            return

        secret = load_token()
        if secret and body.get("token") != secret:
            log.warning(f"Rejected bad token from {self.address_string()}")
            self.send_json(403, {"error": "forbidden"})
            return

        url = body.get("url", "").strip()
        if "|" in url:
            url = url.split("|", 1)[1].strip()

        if not url or not is_valid_url(url):
            self.send_json(400, {"error": "missing or invalid url"})
            return

        self.send_json(202, {"status": "accepted", "url": url})
        threading.Thread(target=run_import, args=(url,), daemon=True).start()


if __name__ == "__main__":
    log.info(f"Recipe webhook listening on {BIND_HOST}:{PORT}")
    server = http.server.ThreadingHTTPServer((BIND_HOST, PORT), WebhookHandler)
    server.serve_forever()
