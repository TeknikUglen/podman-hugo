# Hugo in a Container

[![License: ISC](https://img.shields.io/badge/License-ISC-blue.svg)](https://opensource.org/licenses/isc)
[![Podman](https://img.shields.io/badge/Podman-grey?logo=podman&logoColor=ffffff)](https://github.com/containers/podman)
[![Hugo](https://img.shields.io/badge/Static%20Site%20Builder-Hugo-green)](https://gohugo.io/)

This repository holds the means to build a simple container for creating Hugo static site content.

Source files should be placed in the src folder. If you need to create a new Hugo site please follow the instructions on the official Hugo website.

## Scripts

Scripts are supplied for building and starting the container as well as preparing files for deployment online.

- build_image.sh - builds the container image
- start_container.sh - starts a container listening on port 1313 and uses the `src` directory as a source. The files are served via http.
- build_site.sh - will build the files into the `src/site_build` folder. Ready for deployment to a web server.

## Build command

```sh
podman build -t teknikuglen/hugo-builder:1 -f Containerfile .
```

## Run container

The container will also serve draft files. Perfect for developing your documents. 

```sh
podman run --rm -v $(pwd)/src:/src -p 127.0.0.1:1313:1313 teknikuglen/hugo-builder hugo server -D
```

## Generate output files

This will generate the final static files and place them in the `site_build` directory.

```sh
podman run --rm -v $(pwd)/src:/src teknikuglen/hugo-builder hugo -d /src/site_build
```