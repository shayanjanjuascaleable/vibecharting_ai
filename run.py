"""
Main entry point for running the Flask application on Azure.
"""
import os
import sys
from pathlib import Path

# 1. Path setup: Current directory ko system path mein shamil karein
# Is se 'from backend import app' wala error khatam ho jayega
base_dir = Path(__file__).resolve().parent
sys.path.append(str(base_dir))

# 2. App import: Ye 'backend/__init__.py' se app object uthayega
try:
    from backend import app
except ImportError as e:
    print(f"Error: Could not import 'app' from 'backend'. Make sure backend/__init__.py has 'app = Flask(__name__)'")
    raise e

# 3. Execution logic: Azure ya local run ke liye
if __name__ == '__main__':
    # Azure default port 8000 use karta hai, local par 5000 ya 8000 chalega
    port = int(os.environ.get("PORT", 8000))
    app.run(host='0.0.0.0', port=port, debug=True)