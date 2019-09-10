#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

if [[ "${#INPUT_FILTER}" -eq "0" ]]
  then
    echo Error: Please include an argument.
    exit 1
else
  if [[ $(echo $INPUT_FILTER) ]]
    then
      echo Filter not triggered. Resuming workflow.
    else
      echo Filter triggered and halting the rest of the workflow.
      exit 1
  fi
fi