FROM opensuse/tumbleweed:latest

RUN zypper -n in hugo && \
    zypper -n clean

COPY --chmod=555 container-entrypoint.sh /usr/local/bin/

WORKDIR /src

EXPOSE 1313

ENTRYPOINT [ "container-entrypoint.sh" ]

CMD [ "hugo" ]
