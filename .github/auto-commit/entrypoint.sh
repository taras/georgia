#!/bin/sh
set -e

sh -c "echo "`node -e \"console.log(require('./package.json').version)\"`"&& git add -A && git commit -m '$*' --allow-empty && git push -u origin HEAD"