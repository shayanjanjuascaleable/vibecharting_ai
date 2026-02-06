"""
Main entry point for running the Flask application on Azure.
"""
import os
import sys
from pathlib import Path

base_dir = Path(__file__).resolve().parent
sys.path.append(str(base_dir))

try:
    from backend import app
except ImportError as e:
    print(f"Error: Could not import 'app' from 'backend'. Make sure backend/__init__.py has 'app = Flask(__name__)'")
    raise e

if __name__ == '__main__':
    port = int(os.environ.get("PORT", 8000))
    app.run(host='0.0.0.0', port=port, debug=True)