#!/bin/sh
set -e
IFS=$'\n\t'

RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

for branch in $(git for-each-ref --format='%(refname)' refs/heads/); do
    #echo "${$branch#*refs\/heads\/}"
    echo $branch
done
echo before
echo $results
echo after