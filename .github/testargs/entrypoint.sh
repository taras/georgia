#!/bin/sh
set -e

RED='\033[1;31m'
YELLOW='\033[1;33m'
NC='\033[0m'

if [ "${#INPUT_NPM_PUBLISH}" -eq "0" ]
  then echo default npm publish
else
  echo $INPUT_NPM_PUBLISH and args
fi