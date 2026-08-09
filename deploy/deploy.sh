#!/usr/bin/env bash
# Build the site locally and sync it to the Contabo server.
# Usage: SERVER_USER=deploy SERVER_HOST=203.0.113.10 SERVER_PATH=/var/www/portfolio ./deploy/deploy.sh
set -euo pipefail

SERVER_USER="${SERVER_USER:?Set SERVER_USER, e.g. deploy}"
SERVER_HOST="${SERVER_HOST:?Set SERVER_HOST, e.g. your Contabo server IP or domain}"
SERVER_PATH="${SERVER_PATH:?Set SERVER_PATH, e.g. /var/www/portfolio}"

npm run build

rsync -avz --delete dist/ "${SERVER_USER}@${SERVER_HOST}:${SERVER_PATH}/"

echo "Deployed dist/ to ${SERVER_USER}@${SERVER_HOST}:${SERVER_PATH}"
