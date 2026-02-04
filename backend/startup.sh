# 1. Update and install ODBC Drivers
apt-get update && apt-get install -y unixodbc-dev
curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add -
curl https://packages.microsoft.com/config/debian/11/prod.list | tee /etc/apt/sources.list.d/mssql-release.list
apt-get update
ACCEPT_EULA=Y apt-get install -y msodbcsql17

# 2. Start the Flask App using Gunicorn
# We add export PYTHONPATH=. to ensure the 'backend' folder is found as a package.
# 'run' refers to run.py, and 'app' is the Flask instance.
export PYTHONPATH=$PYTHONPATH:.
gunicorn --bind=0.0.0.0 --timeout 600 run:app