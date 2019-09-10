#!/bin/bash

set -euo pipefail
IFS=$'\n\t'

if [[ "${#INPUT_PARAMETER}" -eq "0" ]]; then
  echo Error: Please include a \`parameter:\` under \`with:\`.
  exit 1
elif [[ "${#INPUT_ARGUMENT}" -eq "0" ]]; then
  echo Error: Please include a \`parameter:\` under \`with:\`.
  exit 1
else
  #if [[ $(echo "hello world" | grep "world") ]]
  if [[ "hello hiya" =~ "hiya" ]]
    then
      echo "It's there!"
    else
      echo "no"
  fi

#!/bin/bash
#expr match
# a == *a*
# a == a
# =~

fi
