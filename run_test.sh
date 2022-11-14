#!/bin/bash

./createcerts.sh

echo "Startung server"
poetry run twistd web --https=8443 --path=./site/ -c cert.pem -k cert.key

echo "Running script"
poetry run python test_script.py

echo "Killing server"
kill "$(cat twistd.pid)"