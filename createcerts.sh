#!/bin/bash

set -e

# Generate private key
echo "Generating private key..."
openssl genpkey -out cert.key -algorithm RSA -pkeyopt rsa_keygen_bits:2048

# Create CSR with proper configuration (including localhost)
echo "Creating CSR..."
openssl req -new -key cert.key -batch -out request.csr -config cert_config

# Create self-signed certificate, note we need to use the extensions from the config
echo "Creating self-signed certificate..."
openssl x509 -req -days 365 -in request.csr -signkey cert.key -out cert.pem \
  -extfile cert_config -extensions v3_req

# Clean up
echo "Self-signed certificate created with localhost in subject"

