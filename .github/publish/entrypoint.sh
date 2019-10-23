#!/bin/sh
set -e


#npm version "`node -e \"console.log(require('./package.json').version)\"`-`git log --pretty=format:'%h' -n 1`" --no-git-tag-version
# echo "//npm.pkg.github.com/:_authToken=${GITHUB_TOKEN}" >> .npmrc
#npm publish
# npm view @minkimcello/georgia@1.10.15-y-7761089

echo $INPUT_PACKAGES

for animal in $INPUT_PACKAGES; do
echo "hi $animal"
done;
