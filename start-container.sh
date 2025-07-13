#!/usr/bin/bash

podman run --rm -v $(pwd)/src:/src:Z -p 1313:1313 --userns=keep-id teknikuglen/hugo-builder hugo server -D --bind=0.0.0.0
