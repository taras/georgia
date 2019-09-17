#!/bin/bash
set -e

yeah=$(echo "`node -e \"console.log(require('./package.json').scripts.wha)\"`")

echo $yeah