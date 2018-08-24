#!/usr/bin/env bash

if [[ -z "${CLEVERCLOUD_TOKEN}" ]]; then
    echo "CLEVERCLOUD_TOKEN environment variable is undefined"
    exit 1
fi
if [[ -z "${CLEVERCLOUD_SECRET}" ]]; then
    echo "CLEVERCLOUD_SECRET environment variable is undefined"
    exit 1
fi
if [[ -z "${CLEVERCLOUD_APP}" ]]; then
    echo "CLEVERCLOUD_APP environment variable is undefined"
    exit 1
fi
if [[ -z "${LOGSTASH_HOST}" ]]; then
    echo "LOGSTASH_HOST environment variable is undefined"
    exit 1
fi
if [[ -z "${LOGSTASH_PORT}" ]]; then
    echo "LOGSTASH_PORT environment variable is undefined"
    exit 1
fi

echo "{\"token\": \"${CLEVERCLOUD_TOKEN}\", \"secret\": \"${CLEVERCLOUD_SECRET}\"}" > /root/.config/clever-cloud

clever link ${CLEVERCLOUD_APP}

exec "$@"
