#!/bin/bash

openssl genpkey -out cert.key -algorithm RSA -pkeyopt rsa_keygen_bits:2048


openssl req -new -key cert.key -out request.csr -batch -config cert_config

openssl x509 -req -days 365 -in request.csr -signkey cert.key -out cert.pem

