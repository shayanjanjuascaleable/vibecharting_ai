# 1. Update and install ODBC Drivers
# These are required for pyodbc to connect to Azure SQL Database.
apt-get update && apt-get install -y unixodbc-dev
curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add -
curl https://packages.microsoft.com/config/debian/11/prod.list | tee /etc/apt/sources.list.d/mssql-release.list
apt-get update
ACCEPT_EULA=Y apt-get install -y msodbcsql17

# 2. Start the Flask App using Gunicorn
# We add export PYTHONPATH=. to ensure the 'backend' folder is found as a package.
# This fixes the "ModuleNotFoundError: No module named 'backend.app'" seen in logs.
export PYTHONPATH=$PYTHONPATH:.

# 'run' refers to run.py, and 'app' is the Flask instance defined inside.
gunicorn --bind=0.0.0.0 --timeout 600 run:app