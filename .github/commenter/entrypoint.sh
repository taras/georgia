#!/bin/sh
set -e
IFS=$'\n\t'

RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

cat << "EOT" > dangerfile.js
const { markdown } = require('danger');
const pjson = require('./example.json');

//function bye(){
//  return "bye"
//}
//markdown(bye())

function maybe(){
  let array = [];
  pjson.packages.map(x=>{
    array.push(markdown(`${x.name}`))
  })
  return array.toString();
}

maybe();

EOT

yarn global add danger --dev
export PATH="$(yarn global bin):$PATH"
danger ci
