#!/bin/bash
set -e
IFS=$'\n\t'

RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

results=()
for branch in $(git ls-remote --heads origin  | sed 's?.*refs/heads/??'); do
    #echo "${$branch#*refs\/heads\/}"
    echo $branch
    results+=("$branch")
done
echo before
echo $results
echo after