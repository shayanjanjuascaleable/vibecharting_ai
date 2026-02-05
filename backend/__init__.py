from flask import Flask
from flask_cors import CORS

# 1. App initialize karein
app = Flask(__name__)
CORS(app)

# 2. Apne baaki logic/routes ko yahan register karein
# Note: Hum niche import kar rahe hain taake circular import na ho
from backend import config, safe_sql, paths

# Agar aapke paas koi specific routes file hai, to usay bhi yahan add karein
