#!/bin/bash
set -e

echo "//registry.npmjs.org/:_authToken=$NPM_AUTH_TOKEN" > ~/.npmrc

npm version "`node -e \"console.log(require('./package.json').version)\"`-`git log --pretty=format:'%h' -n 1 --skip 1`" --no-git-tag-version

npm publish --access=public