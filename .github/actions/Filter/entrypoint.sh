#!/bin/bash
set -e

if [[ "${#INPUT_PARAMETER}" -ne "0" ]]
then
  echo Error: Please include a \`parameter:\` under \`with:\`.
  exit 1
elif [[ "${#INPUT_ARGUMENT}" -eq "0" ]]
then
  echo Error: Please include a \`parameter:\` under \`with:\`.
  exit 1
else
  echo "$INPUT_PARAMETER"
  echo "$INPUT_ARGUMENT"
fi