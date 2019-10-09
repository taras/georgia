#!/bin/sh
set -e
IFS=$'\n\t' #required for checking tag against user argument

RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
NC='\033[0m'
package="`node -e \"console.log(require('./package.json').name)\"`"

# one time
echo "//registry.npmjs.org/:_authToken=$NPM_AUTH_TOKEN" > ~/.npmrc
npm publish --tag features-2

# for tag in $(npm dist-tag ls | sed 's/\:.*//'); do
#   if [[ "$tag" = "latest" ]] || [[ $(echo "$INPUT_KEEP" | grep -e "$tag") ]]
#     then
#       echo -e "${GREEN}Skipping protected tag, ${YELLOW}$tag${GREEN}."
#   elif [[ $(echo "$(git ls-remote --heads origin  | sed 's?.*refs/heads/??')" | grep -e "$tag") ]]
#     then
#       echo -e "${GREEN}Keeping tag, ${YELLOW}$tag${GREEN}, on NPM because we found a matching branch.${NC}"
#   else
#     #echo "//registry.npmjs.org/:_authToken=$NPM_AUTH_TOKEN" > ~/.npmrc
#     npm dist-tag rm $package $tag
#     echo -e "${YELLOW}Removed tag, ${RED}$tag${YELLOW}, from NPM because it did not match any existing branches on HEAD.${NC}"
#   fi
# done

# npm tags
    # beta = delete
    # dev = put in keep = saved
    # features-2 = saved
    # latest = saved

# branches
    # features
    # features-2
    # master
    # release-1.0.0
    # release-2.0.0