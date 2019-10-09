#!/bin/sh
set -e

RED='\033[1;31m'
NC='\033[0m'

if [ "${#NPM_AUTH_TOKEN}" -eq "0" ]
  then
    echo -e "${RED}ERROR: NPM_AUTH_TOKEN not detected. Please add your NPM Token to your repository's secrets.${NC}"
  else
    if [[ "$GITHUB_HEAD_REF" = "features-2" ]]
      then
        echo -e "${RED}ERROR: Unable to publish preview because your branch conflicts with NPM's protected 'latest' tag. Please change the name of your branch and resubmit the pull request.${NC}"
        exit 1
      else
        ## remove below
        npm version "`node -e \"console.log(require('./package.json').version)\"`-`git log --pretty=format:'%h' -n 1`" --no-git-tag-version
        ## remove above

        echo "//registry.npmjs.org/:_authToken=$NPM_AUTH_TOKEN" > ~/.npmrc
        npm publish --access=public --tag $GITHUB_HEAD_REF
    fi
fi