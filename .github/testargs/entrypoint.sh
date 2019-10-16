#!/bin/sh
set -e

RED='\033[1;31m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo "//registry.npmjs.org/:_authToken=$NPM_AUTH_TOKEN" > ~/.npmrc
npm config set unsafe-perm true
npm install
if [ "${#INPUT_NPM_PUBLISH}" -eq "0" ]
  then npm publish --access=public --tag "tester-1"
else
  npm run $INPUT_NPM_PUBLISH --access=public --tag "tester-2"
fi
