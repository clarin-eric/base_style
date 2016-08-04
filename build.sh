#!/bin/sh

curl --fail --location --show-error --silent --tlsv1 "$BOOTSTRAP_DEP_URL" \
    --output 'bootstrap.tgz'
