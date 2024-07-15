FROM docker.io/library/ubuntu

LABEL org.opencontainers.image.source=https://github.com/computator/update-recent

COPY update_recent.sh /usr/local/bin/

CMD ["update_recent.sh", "/data"]
