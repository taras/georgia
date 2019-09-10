#!/bin/bash
set -e

if [[ "${#INPUT_PARAMETER}" -eq "0" ]]
then
  echo Error: Please include a \`parameter:\` under \`with:\`.
  exit 1
elif [[ "${#INPUT_ARGUMENT}" -eq "0" ]]
then
  echo Error: Please include a \`parameter:\` under \`with:\`.
  exit 1
else
  echo $INPUT_PARAMETER
#  if [[ "$(git log -1 --pretty=%B)" =~ "[ci skip]" ]]
fi