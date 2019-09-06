#!/bin/bash
set -e

cd .github
yarn global add danger --dev
export PATH="$(yarn global bin):$PATH"
#cp ~/dangerfile.js /dingding.js
cd .. && echo hiya > test.txt && ls && cp test.txt .github/test.txt && cd .github && ls
# danger ci