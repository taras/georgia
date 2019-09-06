#!/bin/bash
set -e

cd .github
yarn global add danger --dev
export PATH="$(yarn global bin):$PATH"
#cp ~/dangerfile.js /dingding.js
cd .. && ls
# danger ci