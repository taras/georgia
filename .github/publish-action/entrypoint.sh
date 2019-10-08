#!/bin/sh
set -e
IFS=$'\n\t'

RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

if [ "${#NPM_AUTH_TOKEN}" -eq "0" ]
  then
    echo -e "${RED}ERROR: NPM_AUTH_TOKEN not detected. Please add your NPM Token to your repository's secrets.${NC}"
  else 
    npm version "`node -e \"console.log(require('./package.json').version)\"`-`git log --pretty=format:'%h' -n 1`" --no-git-tag-version

    # echo "//registry.npmjs.org/:_authToken=$NPM_AUTH_TOKEN" > ~/.npmrc
    # npm publish

    echo -e "${GREEN}SUCCESS: Published preview to NPM.${NC}"
    echo -e "${YELLOW}Generating comment on pull request...${NC}"

cat << "EOT" > dangerfile.js
const { markdown } = require('danger');
const pjson = require('./package.json');

const install = `npm install ${pjson.name}@${pjson.version}`
const currentNPM = `https://www.npmjs.com/package/${pjson.name}/v/${pjson.version}`
const message = `You can view the NPM package [here](${currentNPM}).`

//markdown(`This PR is available to use:`);
//markdown(``bash'\n`npm install ${pjson.name}@${pjson.version}`\n'```');

markdown(`This PR is available to use:\n\`\`\`bash\n${install}\n\`\`\`\n${message}`)
EOT

    yarn global add danger --dev
    export PATH="$(yarn global bin):$PATH"
    danger ci
        
    echo -e "${GREEN}SUCCESS: Comment generated on pull request.${NC}"
fi