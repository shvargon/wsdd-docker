#!/bin/sh
( : ${HOST?"pls pass -e HOST=somehost"} ) || exit 1

ARGS=""

[[ -z "${WORKGROUP}" ]] || ARGS="$ARGS --workgroup $WORKGROUP"
[[ -z "${DOMAIN}" ]] || ARGS="$ARGS --domain $DOMAIN"

exec echo ${ARGS}
exec python /app/wsdd.py --hostname ${HOST} --workgroup ${WORKGROUP} ${ARGS} $@