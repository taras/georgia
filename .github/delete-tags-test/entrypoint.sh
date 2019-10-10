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
branches_masked="$(echo $branches | sed 's/\//\_/g')"
input_keep_masked="$(echo $INPUT_KEEP | sed 's/\//\_/g')"
npmtags=$(npm dist-tag ls | sed 's/\:.*//')

echo $INPUT_KEEP
echo $input_keep_masked

# for tag in $npmtags; do
  
#   if [[ "$tag" = "latest" ]] || [[ $(echo "$input_keep_masked" | grep -e "$tag") ]]
#     then
#       echo -e "${GREEN}Keeping tag, ${YELLOW}$tag${GREEN}, because it is protected.${NC}"

#   elif [[ $(echo $branches_masked | grep -e "$tag") ]]
#     then
#       echo -e "${GREEN}: Keeping tag, ${YELLOW}$tag${GREEN}, because we found a matching branch.${NC}"
  
#   else
#     echo "//registry.npmjs.org/:_authToken=$NPM_AUTH_TOKEN" > ~/.npmrc
#     npm dist-tag rm $package $tag
#     echo -e "${RED}Removed tag, ${YELLOW}$tag${RED} from NPM because it did not match any existing branches.${NC}"
#   fi
# done