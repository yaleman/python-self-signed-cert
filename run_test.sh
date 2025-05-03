#!/bin/bash

./createcerts.sh

echo "Startung server"
uv run twistd web --https=8443 --path=./site/ -c cert.pem -k cert.key

echo "Running script"
uv run python test_script.py

echo "Killing server"
kill "$(cat twistd.pid)"