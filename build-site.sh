#!/usr/bin/bash

podman run --rm -v $(pwd)/src:/src teknikuglen/hugo-builder hugo -d /src/site_build