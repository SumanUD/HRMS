#!/bin/sh
set -e  # Exit immediately if a command exits with a non-zero status

echo "Applying database migrations..."
python manage.py migrate --noinput

echo "Collecting static files..."
python manage.py collectstatic --noinput

echo "Starting Django server..."
exec python manage.py runserver 0.0.0.0:8000
