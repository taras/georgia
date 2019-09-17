#!/bin/bash
set -euo pipefail

echo 

if [[ "${#$INPUT_ARGS}" -eq "0" ]]
  then
    echo $INPUT_ARGS does not exist
  else
    echo hello?
fi