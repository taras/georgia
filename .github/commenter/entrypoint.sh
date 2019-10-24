#!/bin/sh
set -e
IFS=$'\n\t'

RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

cat << "EOT" > dangerfile.js
const { markdown } = require('danger');

const first_line = `:warning: WARNING :warning:`;
const second_line = `We didn't publish this tag to NPM because it would conflict with the reserved \`latest\` tag.`;

markdown(`${first_line}\n\n${second_line}`)
EOT
  yarn global add danger --dev
  export PATH="$(yarn global bin):$PATH"
  danger ci
fi
