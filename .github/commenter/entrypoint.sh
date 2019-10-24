#!/bin/sh
set -e
IFS=$'\n\t'

RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

cat << "EOT" > dangerfile.js
const { markdown } = require('danger');
const pjson = require('./example.json');

//function bye(){
//  return "bye"
//}
//markdown(bye())

function maybe(){
  let array = [];
  pjson.packages.map(x=>{
    array.push(markdown(`${x.name}`))
  })
  return array.toString();
}

markdown('hello')
maybe();
markdown('bye')

EOT

yarn global add danger --dev
export PATH="$(yarn global bin):$PATH"
danger ci

# cat << "EOT" > dangerfile.js
# const { markdown } = require('danger');
# const pjson = require('./package.json');

# const current = `https://www.npmjs.com/package/${pjson.name}/v/${pjson.version}`
# const branch = process.env.GITHUB_HEAD_REF;
# const masked = branch.replace(/\//g, '_');

# const install_version = `npm install ${pjson.name}@${pjson.version}`;

# const first_line = `A preview package of this pull request has been released to NPM with the tag \`${masked}\`.`;
# const second_line = `You can try it out by running the following command:`;
# const install_tag = `$ npm install ${pjson.name}@${masked}`;
# const fourth_line = `or by updating your package.json to:`
# const update_json = `\{\n  \"${pjson.name}\": \"${masked}\"\n\}`
# const last_line = `Once the branch associated with this tag is deleted (usually once the PR is merged or closed), it will no longer be available. However, it currently references [${pjson.name}@${pjson.version}](${current}) which will be available to install forever.`;

# markdown(`${first_line}\n${second_line}\n\`\`\`bash\n${install_tag}\n\`\`\`\n${fourth_line}\n\`\`\`bash\n${update_json}\n\`\`\`\n${last_line}`)
# EOT
