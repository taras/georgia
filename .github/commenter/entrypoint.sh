#!/bin/sh
set -e
IFS=$'\n\t'

RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo "//npm.pkg.github.com/:_authToken=${GITHUB_TOKEN}" >> .npmrc
npm dist-tag rm @minkimcello/georgia gitreg

# cat << "EOT" > dangerfile.js
# const { markdown } = require('danger');
# const pjson = require('./example.json');

# //function bye(){
# //  return "bye"
# //}
# //markdown(bye())

# //function maybe(){
# //  let array = [markdown('hello')];
# //  pjson.packages.map(x=>{
# //    array.push(markdown(`${x.name}`))
# //  })
# //  array.push(markdown('bye'));
# //  return array.toString();
# //}

# //maybe();
# // let array = [markdown('first'), markdown('second'), markdown('third')]
# // return array.toString();

# let drop = '<details><summary>package1</summary>hellos</details>'
# let drop2 = '<details><summary>package2</summary>hellos</details>'
# markdown(`${drop}\n${drop2}`)

# EOT

# yarn global add danger --dev
# export PATH="$(yarn global bin):$PATH"
# danger ci

# npm install @minkimcello/georgia@gitreg

# cat << "EOT" > dangerfile.js
# const { markdown } = require('danger');
# const pjson = require('./package.json');

# const current = `https://www.npmjs.com/package/${pjson.name}/v/${pjson.version}`
# const branch = process.env.GITHUB_HEAD_REF;
# const masked = branch.replace(/\//g, '_');

# const install_version = `npm install ${pjson.name}@${pjson.version}`;


# const second_line = `You can try it out by running the following command:`;
# const install_tag = `$ npm install ${pjson.name}@${masked}`;
# const fourth_line = `or by updating your package.json to:`
# const update_json = `\{\n  \"${pjson.name}\": \"${masked}\"\n\}`
# const last_line = `Once the branch associated with this tag is deleted (usually once the PR is merged or closed), it will no longer be available. However, it currently references [${pjson.name}@${pjson.version}](${current}) which will be available to install forever.`;

# markdown(`${first_line}\n${second_line}\n\`\`\`bash\n${install_tag}\n\`\`\`\n${fourth_line}\n\`\`\`bash\n${update_json}\n\`\`\`\n${last_line}`)
# EOT

# `The packages of this pull request has been released to Github Package Registry with the tag \`${pjson.tag}\`.`;
# `Click on the following packages for instructions on how to install them:`;

# `Once the branch associated with this tag is deleted (usually once the PR is merged or closed), it will no longer be available. However, it currently references [${pjson.name}@${pjson.version}](${current}) which will be available to install forever.`
