#!/usr/bin/env bash

HOSTS=$(grep -oP '(?<=Host\(`).*(?=`\))' compose.yml)

mkcert.exe \
    -cert-file traefik/certs/local-cert.pem \
    -key-file traefik/certs/local-key.pem \
    $HOSTS
