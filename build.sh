#!/bin/sh

mkdir -- 'bootstrap/'
cd -- "$_" || return
curl --fail --location --show-error --silent --tlsv1.2 -- \
    "$BOOTSTRAP_ARTIFACT_URL" | \
    tar -f - -p --strip-components=1 -x -z
cd -- '-' || return
