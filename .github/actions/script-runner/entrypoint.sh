#!/bin/bash
set -euo pipefail

echo 

if [[ "${#$INPUT_TEST}" -eq "0" ]]
  then
    echo $INPUT_TEST does not exist
  else
    echo hello?
fi