#!/bin/sh
set -e


echo "//npm.pkg.github.com/:_authToken=$GITHUB_TOKEN" > ~/.npmrc
npm version "`node -e \"console.log(require('./package.json').version)\"`-`git log --pretty=format:'%h' -n 1`" --no-git-tag-version
#tag="$(echo $GITHUB_HEAD_REF | sed -E 's:_:__:g;s:\/:_:g')"
npm publish --access=public --tag "gitreg"
