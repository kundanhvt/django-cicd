#!/bin/bash

source venv/bin/activate

pwd
cd app

python3 manage.py makemigrations
python3 manage.py migrate
python3 manage.py collectstatic -- no-input

echo "Migration done"

# cd var/lib/jenkis/workspace/django-cicd
cd ../

sudo cp -rf gunicorn.socket /etc/systemd/system/
sudo cp -rf gunicorn.service /etc/systemd/system/

echo "$USER"
echo "$PWD"

sudo systemctl daemon-reload
sudo systemctl start gunicorn

echo "Gunicorn has been started"

sudo systemctl restart gunicorn
sudo systemctl status gunicorn