#!/bin/sh
set -e

RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

## can't remove tags
# echo "//npm.pkg.github.com/:_authToken=${GITHUB_TOKEN}" >> .npmrc
# npm dist-tag rm @minkimcello/georgia gitreg

cat << "EOT" > dangerfile.js
const { markdown } = require('danger');
const pjson = require('./published.json');

//function bye(){
//  return "bye"
//}
//markdown(bye())

function maybe(){
  let array = [];
  pjson.packages.map(x=>{
    array.push(drop(x.name, x.version))
  })
  return array.toString();
}

function drop(name, body){
  return "<details><summary>${name}</summary>${body}</details>"
}

markdown(maybe())

EOT

yarn global add danger --dev
export PATH="$(yarn global bin):$PATH"
danger ci

# npm install @minkimcello/georgia@gitreg

# const branch = process.env.GITHUB_HEAD_REF;
# const masked = branch.replace(/\//g, '_');

# const install_version = `npm install ${pjson.name}@${pjson.version}`;

# const install_tag = `$ npm install ${pjson.name}@${masked}`;
# const fourth_line = `or by updating your package.json to:`
# const update_json = `\{\n  \"${pjson.name}\": \"${masked}\"\n\}`

# markdown(`${first_line}\n${second_line}\n\`\`\`bash\n${install_tag}\n\`\`\`\n${fourth_line}\n\`\`\`bash\n${update_json}\n\`\`\`\n${last_line}`)

# const first_line = `The packages of this pull request has been released to Github Package Registry with the tag \`${pjson.tag}\`.`;
# const second_line = `Click on the following packages for instructions on how to install them:`;

