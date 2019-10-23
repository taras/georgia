#!/bin/sh
set -e


npm version "`node -e \"console.log(require('./package.json').version)\"`-`git log --pretty=format:'%h' -n 1`"
echo "//npm.pkg.github.com/:_authToken=${GITHUB_TOKEN}" >> .npmrc
npm publish
