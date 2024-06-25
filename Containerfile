FROM opensuse/tumbleweed:latest

RUN zypper -n in hugo && \
    zypper -n clean

COPY container-entrypoint.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/container-entrypoint.sh

WORKDIR /src

EXPOSE 1313

ENTRYPOINT [ "container-entrypoint.sh" ]

CMD [ "hugo" ]
