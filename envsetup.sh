#!/bin/bash
if [ -d "venv" ]
then
    echo "Python virtual environment exists."
else
    python3 -m venv venv
fi

pwd

source venv/bin/activate

pip3 install -r requirements.txt

if [ -d "logs" ]
then
    echo "Log folder exists."
else
    mkdir logs
    touch logs/error.log logs/access.log
fi
echo "User is:"
whoami

sudo -S 'root' chmod -R 777 logs