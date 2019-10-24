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
  let stringy = "";
  pjson.packages.map(x=>{
    stringy += drop(x.name, x.version)
  })
  return stringy;
}

function drop(name, body){
  const install_tag = `$ npm install ${name}@${pjson.tag}`
  const or_line = `or doo doo`
  return `<details><summary>${name}</summary>Install using the following command:\n\`\`\`bash\n${install_tag}\n\`\`\`\n${or_line}</details>`
}

const first_line = `The packages of this pull request has been released to Github Package Registry.`;
const second_line = `Click on the following packages for instructions on how to install them:`;

markdown(`${first_line}\n${second_line}\n${maybe()}\nbyebye`)

EOT

yarn global add danger --dev
export PATH="$(yarn global bin):$PATH"
danger ci

# const fourth_line = `or by updating your package.json to:`
# const update_json = `\{\n  \"${pjson.name}\": \"${masked}\"\n\}`

# markdown(`${fourth_line}\n\`\`\`bash\n${update_json}\n\`\`\`\n${last_line}`)



