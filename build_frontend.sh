# 1. Update and install ODBC Drivers (Jo aapne pehle likha hai)
apt-get update && apt-get install -y unixodbc-dev
curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add -
curl https://packages.microsoft.com/config/debian/11/prod.list | tee /etc/apt/sources.list.d/mssql-release.list
apt-get update
ACCEPT_EULA=Y apt-get install -y msodbcsql17

# 2. Start the Flask App using Gunicorn
# 'run' is the filename (run.py), 'app' is the Flask instance inside it
gunicorn --bind=0.0.0.0 --timeout 600 run:app