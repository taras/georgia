#!/bin/sh -l

# Install danger cli on the machine
yarn global add danger --dev

# install needed dependencies
yarn

# Run danger
danger --dangerfile "./dangerfile.js" ci