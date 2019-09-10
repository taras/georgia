#!/bin/sh
set -e

if [[ "${#INPUT_PARAMETER}" -eq "0" ]]; then
  echo Error: Please include a \`parameter:\` under \`with:\`.
  exit 1
elif [[ "${#INPUT_ARGUMENT}" -eq "0" ]]; then
  echo Error: Please include a \`parameter:\` under \`with:\`.
  exit 1
else
  if expr match $($INPUT_PARAMETER) skip; then
    echo yes
    exit 1; else
    echo ohno;
  fi
fi