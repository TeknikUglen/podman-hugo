#!/usr/bin/env bash
set -e

if [ "$1" = "hugo" ]; then
  if [ ! -f config.toml ] && [ ! -f config.yaml ] && [ ! -f config.json ]; then
    echo "⚠️  Hugo site configuration is missing!"
    echo "Expected one of: config.toml, config.yaml, or config.json"
    echo ""
    exit 1
  fi
fi 

exec "$@"
