#!/bin/bash
set -e

# git setup
git remote set-url origin https://${GITHUB_TOKEN}:x-oauth-basic@github.com/${GITHUB_REPOSITORY}.git
git fetch origin +refs/heads/*:refs/heads/*
branch=$(printf "%s\n" "${GITHUB_REF#*refs\/heads\/}")
git checkout $branch

git_config_email="`node -e \"console.log(require('./package.json').author.email)\"`"
git_config_name="`node -e \"console.log(require('./package.json').author.name)\"`"

git config user.email $git_config_email
git config user.name $git_config_name