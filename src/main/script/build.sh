#!/bin/sh
set -e
npm set progress='false'
npm --silent install --global 'grunt-cli'
curl --fail --location --proto '=https' --silent --show-error --tlsv1 \
    "https://github.com/twbs/bootstrap/archive/v${BOOTSTRAP_VER}.zip" \
    | bsdtar -xf -
## Apply CLARIN base style.
cd -- "bootstrap-${BOOTSTRAP_VER}/"
cp -f -- '../src/main/less/variables.less' 'less/variables.less'
npm --silent install
grunt dist
tar -f "../bootstrap-clarin-${STYLE_VERSION}.tgz" -c -v -z 'dist/'
