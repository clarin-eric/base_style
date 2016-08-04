#!/bin/sh

mkdir -- 'bootstrap/'
cd -- 'bootstrap/' || return
curl --fail --location --show-error --silent --tlsv1 -- \
    "$BOOTSTRAP_DEP_URL" | \
    tar -f - -p --strip-components=1 -x -z
cd -- '-' || return
