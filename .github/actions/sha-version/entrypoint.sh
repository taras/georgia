#!/bin/bash
set -e

echo $GITHUB_SHA

# npm version "`node -e \"console.log(require('./package.json').version)\"`-`git log --pretty=format:'%h' -n 1 --skip 1`" --no-git-tag-version

npm version "`node -e \"console.log(require('./package.json').version)\"`-`git rev-parse --short ${GITHUB_SHA}`" --no-git-tag-version