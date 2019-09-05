#!/bin/bash
set -e

echo hello
cd .github
yarn global add danger --dev
export PATH="$(yarn global bin):$PATH"
danger ci