
FROM samber/clever-tools:0.10.1

WORKDIR /app
ENTRYPOINT ["/entrypoint.sh"]
CMD ["/run.sh"]

RUN mkdir -p /root/.config \
    && apt-get update \
    && apt-get install -y jq netcat \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

COPY *.sh /
