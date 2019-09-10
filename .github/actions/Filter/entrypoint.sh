#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

if [[ "${#INPUT_FILTER}" -eq "0" ]]
  then
    echo Error: Please include an argument.
    exit 1
else
  if [[ $(git log -1 --pretty=%B | grep "hello") ]]
    then
      echo Filter triggered and halting the rest of the workflow.
      echo $(git log -1 --pretty=%B)
      exit 1
    else
      echo Filter not triggered. Resuming workflow.
  fi
fi