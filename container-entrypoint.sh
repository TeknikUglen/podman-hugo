#!/bin/bash
set -e

if [ ! -f hugo.toml ]; then
  echo "Site files seem to be missing"
  echo ""
  exit 1
fi

exec "$@"