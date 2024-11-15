#!/usr/bin/env bash

# get all host domains, remove empty lines
HOSTS=$(awk -F '[`]' '{print $2}' compose.yml | sed -e '/^$/d')

mkcert.exe \
    -cert-file traefik/certs/local-cert.pem \
    -key-file traefik/certs/local-key.pem \
    $HOSTS
