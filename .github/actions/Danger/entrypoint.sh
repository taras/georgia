#!/bin/bash
set -e

cd .github
yarn global add danger --dev
export PATH="$(yarn global bin):$PATH"
# cd ../ && cp dangerfile.js .github/dangerfile.js && echo weeeeeeeeeee && cd .github && ls
# danger ci

cd ../../ && ls
echo weeeeeeeeeeeeee
cd ../ && ls
echo weeeeeeeeeeeeee
cd ~ && ls