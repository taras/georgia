#!/bin/bash
set -e

echo "`node -e \"console.log(require('./package.json').version)\"`-`git log --pretty=format:'%h' -n 1 --skip 1`"