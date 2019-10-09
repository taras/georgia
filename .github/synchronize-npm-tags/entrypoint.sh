#!/bin/sh
set -e
IFS=$'\n\t'

RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
NC='\033[0m'
    #echo "${$branch#*refs\/heads\/}"

for branch in $(git ls-remote --heads origin  | sed 's?.*refs/heads/??'); do
    echo $branch | grep -oe "features"
done

for tag in $(npm dist-tag ls | grep -E ".+?(?=':')"); do 
  echo $tag 
done