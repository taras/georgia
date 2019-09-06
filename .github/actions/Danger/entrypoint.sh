#!/bin/bash
set -e

yarn global add danger --dev
export PATH="$(yarn global bin):$PATH"
danger ci --dangerfile ./.github/