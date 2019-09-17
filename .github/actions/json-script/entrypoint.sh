#!/bin/bash
set -e

echo "`node -e \"console.log(require('./package.json').scripts)\"`"