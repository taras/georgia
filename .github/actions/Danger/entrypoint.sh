#!/bin/bash
set -e

if [[ -z "$DANGER_GITHUB" ]]; then
	echo "Set the GITHUB_TOKEN env variable."
	exit 1
fi

cd .github
yarn global add danger --dev
export PATH="$(yarn global bin):$PATH"
danger ci