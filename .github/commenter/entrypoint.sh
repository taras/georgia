#!/bin/sh
set -e
IFS=$'\n\t'

RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

cat << "EOT" > dangerfile.js
const { markdown } = require('danger');

const first_line = `:mega: Heads up!`;
const second_line = `I didn't detect an NPM_AUTH_TOKEN which is necessary to publish a preview version of this package, and so I wasn't able to. However, this is perfectly normal for pull requests that are submitted from a forked repository.`;

markdown(`${first_line}\n\n${second_line}`)
EOT
  yarn global add danger --dev
  export PATH="$(yarn global bin):$PATH"
  danger ci
