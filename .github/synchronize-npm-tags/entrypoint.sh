#!/bin/sh
set -e
IFS=$'\n\t'

RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

git ls-remote

for branch in $(git for-each-ref --format='%(refname)' refs/remotes/origin/); do
    git log --oneline "$branch" ^origin/master
done