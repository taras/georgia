#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

if [[ "${#INPUT_FILTER}" -eq "0" ]]
  then
    echo Error: Please include an argument.
    exit 1
else
  if [[ $(echo $INPUT_TEST) ]]
    then
      echo Filter triggered and halting the rest of the workflow.
      echo ${$INPUT_TEST}
      exit 1
    else
      echo Filter not triggered. Resuming workflow.
  fi
fi