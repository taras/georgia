#!/bin/bash
set -e

echo $($PR_LABELS)

# npm version "`node -e \"console.log(require('./package.json').version)\"`-`git log --pretty=format:'%h' -n 1 --skip 1`" --no-git-tag-version