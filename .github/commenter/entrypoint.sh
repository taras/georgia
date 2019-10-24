#!/bin/sh
set -e
IFS=$'\n\t'

RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

cat << "EOT" > dangerfile.js
const { markdown } = require('danger');

function bye(){
  return "bye"
}

markdown(bye())

function maybe(){
  for (i=0; i < 3; i++){
    markdown(`${i}`);
  }
  return comment;
}

let arrayz = [markdown('hi one'), markdown('yeah two')];
let stringy = arrayz.toString();
return stringy;

EOT
  yarn global add danger --dev
  export PATH="$(yarn global bin):$PATH"
  danger ci
