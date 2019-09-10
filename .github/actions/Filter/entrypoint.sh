#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

if [[ "${#INPUT_FILTER}" -eq "0" ]]
  then
    echo Error: Please include a filter.
    exit 1
else  
  # if [[ $(echo "$(git log -1 --pretty=%B)" | grep "hello") ]]
  ## above works

  if [[ $(echo "$(git log -1 --pretty=%B)" | grep "$INPUT_FILTER") ]]
  ## testing
  
  # if [[ $(echo $((git log -1 --pretty=%B) | grep "hello")) ]]
  ## doesn't work

  # if [[ $(echo "$($INPUT_ARGUMENT)" | grep $INPUT_FILTER) ]]
  ## doesn't work
  
    then
      echo Filter triggered and halting the rest of the workflow.
      #echo $($INPUT_ARGUMENT)
      exit 1
    else
      echo Filter not triggered. Resuming workflow.
  fi
fi