#!/usr/bin/env bash

#set -x
set -e

ORG_NAME=$(cat .clever.json | jq -r '.apps[].org_id')
APP_NAME=$(cat .clever.json | jq -r '.apps[].name')

PREFIX="${ORG_NAME}\\ ${CLEVERCLOUD_APP}\\ ${APP_NAME}\\ "

exec clever logs --no-update-notifier=true --after=$(date --iso-8601=seconds) \
    | grep --line-buffered -v 'Waiting for application logs' \
    | sed -u "s#^#${PREFIX}#g" \
    | tee -a /tmp/logs.txt \
    | nc ${LOGSTASH_HOST} ${LOGSTASH_PORT}
