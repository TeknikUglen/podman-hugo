#!/usr/bin/bash

podman run --rm -v $(pwd)/src:/src -p 1313:1313 teknikuglen/hugo-builder hugo server -D