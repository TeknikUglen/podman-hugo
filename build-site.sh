#!/usr/bin/bash

podman run --rm -v $(pwd)/src:/src:Z --userns=keep-id  teknikuglen/hugo-builder hugo -d /src/site_build
