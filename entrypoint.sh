#!/bin/sh
: "${HOST:?pls pass -e HOST=somehost}"

ARGS=""

[ -n "${WORKGROUP}" ] && ARGS="$ARGS --workgroup ${WORKGROUP}"
[ -n "${DOMAIN}" ] && ARGS="$ARGS --domain ${DOMAIN}"

exec python /app/wsdd.py --hostname "${HOST}" ${ARGS} "$@"