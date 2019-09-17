#!/bin/bash
set -e

test=$(echo "`node -e \"console.log(require('./package.json').scripts.test)\"`")

echo $test