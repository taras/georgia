#!/bin/bash
set -e

cd .github
yarn global add danger --dev
export PATH="$(yarn global bin):$PATH"
export GITHUB_TOKEN={$DANGER_GITHUB}
danger ci