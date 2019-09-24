const { markdown } = require('danger');
const pjson = require('./package.json');

const shorted = process.env.GITHUB_SHA.slice(0, 7);

const currentNPM = `https://www.npmjs.com/package/${pjson.name}/v/${pjson.version}-${shorted}`

markdown(`This PR is available to use:`);
markdown('```bash');
markdown(`npm install ${pjson.name}@${pjson.version}-${shorted}`);
markdown('```');
markdown('in action');
markdown(`You can view the NPM package [here](${currentNPM}).`);