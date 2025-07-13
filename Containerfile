FROM debian:bookworm-slim

# Set hugo version, can be overridden during build
ARG HUGO_VERSION=0.148.1

# Prepare necessary packages
RUN DEBIAN_FRONTEND=noninteractive \
    apt-get update -y && apt-get upgrade -y \
    && apt-get install -y --no-install-recommends \
    ca-certificates \
    curl \
    tar \
    gzip \
    && rm -rf /var/lib/apt/lists/*

# Add hugo user
RUN groupadd -g 1000 hugo \
    && useradd -u 1000 -g hugo -r hugo \
    && mkdir -p /src \
    && chown hugo:hugo /src && chmod 775 /src

# Download and install Hugo
RUN curl -L https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_extended_${HUGO_VERSION}_Linux-64bit.tar.gz \
    | tar -xz -C /usr/local/bin hugo

COPY --chmod=555 container-entrypoint.sh /usr/local/bin/

WORKDIR /src

USER hugo

EXPOSE 1313

ENTRYPOINT [ "container-entrypoint.sh" ]

CMD [ "hugo" ]
