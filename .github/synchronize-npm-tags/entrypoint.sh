#!/bin/sh
set -e
IFS=$'\n\t' #required for checking tag against user argument

RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
BLUE='\033[1;34m'
NC='\033[0m'

package="`node -e \"console.log(require('./package.json').name)\"`"
branches="$(git ls-remote --heads origin  | sed 's?.*refs/heads/??')"
npmtags=$(npm dist-tag ls | sed 's/\:.*//')

echo npmtags: $npmtags
echo branches: $branches
echo package-name: $package

for tag in $npmtags; do
  if [[ "$tag" = "latest" ]] || [[ $(echo "$INPUT_KEEP" | grep -e "$tag") ]]
    then
      echo -e "${GREEN}Skipping protected tag, ${BLUE}$tag${GREEN}."
  elif [[ $(echo $branches | grep -e "$tag") ]]
    then
      echo -e "${GREEN}Keeping tag, ${BLUE}$tag${GREEN}, on NPM because we found a matching branch.${NC}"
  else
    echo "//registry.npmjs.org/:_authToken=$NPM_AUTH_TOKEN" > ~/.npmrc
    npm dist-tag rm $package $tag
    echo -e "${YELLOW}Removed tag, ${RED}$tag${YELLOW}, from NPM because it did not match any existing branches on HEAD.${NC}"
  fi
done