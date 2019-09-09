#!/bin/bash
set -e

npm version "`node -e \"console.log(require('./package.json').version)\"`-`git log --pretty=format:'%h' -n 1 --skip 1`"