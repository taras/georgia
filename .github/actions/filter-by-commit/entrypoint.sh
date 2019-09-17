#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

if [[ "${#INPUT_FILTER}" -eq "0" ]]
  then
    echo Error: Please include a filter.
    exit 1
else  
  if [[ $(echo "$(git log -1 --pretty=%B)" | grep -P '#(\d+)') ]] 
    then
      echo Resuming the rest of the workflow.
    else
      echo Halting the rest of the workflow.
      exit 1
  fi
fi