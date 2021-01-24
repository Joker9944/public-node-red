#!/usr/bin/env bash

set -e

PW=$1

mkdir  secrets
chmod 700 secrets
touch secrets/acme.json
chmod 600 secrets/acme.json

htpasswd -bc secrets/htpasswd admin "$PW"
chmod 600 secrets/htpasswd

mkdir -p etc/node-red/data
sudo chown -R 1000:1000 etc/node-red/data

cp .env.example .env

docker-compose pull
