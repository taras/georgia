#!/bin/bash
set -e

if [[ "${#INPUT_PARAMETER}" -eq "0" ]]; then
  echo Error: Please include a \`parameter:\` under \`with:\`.
  exit 1
elif [[ "${#INPUT_ARGUMENT}" -eq "0" ]]; then
  echo Error: Please include a \`parameter:\` under \`with:\`.
  exit 1
else
#  if [[ $($INPUT_PARAMETER) == *$($INPUT_ARGUMENT)* ]]; then
  if 1;
    echo yes
    exit 1; else
    echo $GITHUB_EVENT_PATH
  fi
fi