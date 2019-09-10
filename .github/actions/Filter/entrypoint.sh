#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

if [[ "${#INPUT_FILTER}" -eq "0" ]]
  then
    echo Error: Please include an argument.
    exit 1
else
  
  # if [[ $(echo $(git log -1 --pretty=%B) | grep "hello") ]]
  ## above works
  
  # if [[ $(echo $((git log -1 --pretty=%B) | grep "hello")) ]]
  ## doesn't work

  if [[ $(echo "${INPUT_ARGUMENT}" | grep "${INPUT_FILTER}") ]]
    then
      echo Filter triggered and halting the rest of the workflow.
      echo ${INPUT_ARGUMENT}
      exit 1
    else
      echo Filter not triggered. Resuming workflow.
  fi
fi