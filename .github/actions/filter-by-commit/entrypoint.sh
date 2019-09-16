#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

if [[ "${#INPUT_FILTER}" -eq "0" ]]
  then
    echo Error: Please include a filter.
    exit 1
else  
  if [[ $(echo "$(git log -1 --pretty=%B)" | grep "$INPUT_FILTER") ]] 
    then
      echo Filter triggered and halting the rest of the workflow.
      exit 1
    else
      echo Filter not triggered. Resuming workflow.
  fi
fi