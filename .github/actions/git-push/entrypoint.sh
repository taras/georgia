#!/bin/bash
set -euo pipefail

# git setup
git remote set-url origin https://${INPUT_GITHUB_TOKEN}:x-oauth-basic@github.com/${GITHUB_REPOSITORY}.git
git fetch origin +refs/heads/*:refs/heads/*
branch=$(printf "%s\n" "${GITHUB_REF#*refs\/heads\/}")
git checkout $branch
# git_config_email="`node -e \"console.log(require('./package.json').author.email)\"`"
# git_config_name="`node -e \"console.log(require('./package.json').author.name)\"`"
git config user.email "$GITHUB_ACTOR@users.noreply.github.com"
git config user.name "$GITHUB_ACTOR"
git add $INPUT_ADD
current="`node -e \"console.log(require('./package.json').version)\"`"
git commit -m "Release version $current [skip-actions]"
git push origin HEAD