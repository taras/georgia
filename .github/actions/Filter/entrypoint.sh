#!/bin/sh
set -e

if [[ "${#INPUT_PARAMETER}" -eq "0" ]]; then
  echo Error: Please include a \`parameter:\` under \`with:\`.
  exit 1
elif [[ "${#INPUT_ARGUMENT}" -eq "0" ]]; then
  echo Error: Please include a \`parameter:\` under \`with:\`.
  exit 1
else
#  if [[ $($INPUT_PARAMETER) == *$($INPUT_ARGUMENT)* ]]; then
  string='My long string'
  if [[ $string == *"My long"* ]]; then
    echo "It's there!"
  fi
fi