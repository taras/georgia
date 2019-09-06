#!/bin/bash
set -e

cd .github
GITHUB_TOKEN=$DANGER_GITHUB yarn global add danger --dev
export PATH="$(yarn global bin):$PATH"
danger ci
# $token danger ci