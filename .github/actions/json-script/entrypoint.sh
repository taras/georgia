#!/bin/bash
set -e

yeah=$(echo "`node -e \"console.log(require('./package.json').scripts)\"`")

echo $yeah