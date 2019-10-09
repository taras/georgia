#!/bin/sh
set -e

RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
NC='\033[0m'
package="`node -e \"console.log(require('./package.json').name)\"`"

# for tag in $(npm dist-tag ls | sed 's/\:.*//'); do
#   if [[ "$tag" = "latest" ]] || [[ $(echo "$INPUT_IGNORE" | grep -e "$tag") ]]
#     then
#       echo -e "${GREEN}Skipping protected tag, ${YELLOW}$tag${GREEN}."
#   elif [[ $(echo "$tag" | grep -e "$(git ls-remote --heads origin  | sed 's?.*refs/heads/??')") ]]
#     then
#       echo -e "${GREEN}Keeping tag, ${YELLOW}$tag${GREEN}, on NPM because we found a matching branch.${NC}"
#   else
#     npm dist-tag rm $package $tag
#     echo -e "${YELLOW}Removed tag, ${RED}$tag${YELLOW}, from NPM because it did not match any existing branches on HEAD.${NC}"
#   fi
# done

echo ignore: $INPUT_IGNORE
echo save: $INPUT_SAVE

# npm tags
# beta
# dev
# features-2
# latest

# branches
# features
# features-2
# master
# release-1.0.0
# release-2.0.0